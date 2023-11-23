use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use File::Temp ();

use Errno;
use Cwd qw(getcwd);
use File::Basename;

use SPVM 'Sys';
use SPVM 'Sys::OS';
use SPVM 'Sys::IO';
use SPVM 'Sys::IO::Windows';
use SPVM 'Sys::FileTest';
use File::Spec;
use SPVM 'TestCase::Sys';

if (SPVM::Sys::OS->is_windows) {
  my $symlink_supported;
  
  require Win32;

  Win32::FsType() eq 'NTFS'
      or skip_all("need NTFS");
  eval { SPVM::Sys->symlink('', '') };
  if ($@ && $@ !~ /not permitted/) {
    $symlink_supported = 1;
  }
  plan skip_all => "no symlink available on Windows"
      if !$symlink_supported;
}

# readlink
{
  my $tmp_dir = File::Temp->newdir;
  ok(SPVM::TestCase::Sys->readlink("$tmp_dir"));
}

# File Tests
{
  my $file_not_exists = "t/ftest/not_exists.txt";
  my $file_empty = "t/ftest/file_empty.txt";
  my $file_bytes8 = "t/ftest/file_bytes8.txt";
  my $file_myexe_exe = "t/ftest/myexe.exe";
  my $file_myexe_bat = "t/ftest/myexe.bat";
  my $file_myexe_cmd = "t/ftest/myexe.cmd";

  # File tests
  {
    ok(SPVM::TestCase::Sys->l);
    is(!!SPVM::Sys->l($file_not_exists), !!-l $file_not_exists);
    is(!!SPVM::Sys->l($file_empty), !!-l $file_empty);
    is(!!SPVM::Sys->l($file_bytes8), !!-l $file_bytes8);
  }
}

my $tmp_dir = File::Temp->newdir;

my $tmpfile1 = File::Spec->catfile($tmp_dir, 'file1');
my $tmpfile2 = File::Spec->catfile($tmp_dir, 'file2');

warn "[Test Output]$tmpfile1 $tmpfile2";

my $ok = SPVM::Sys->symlink($tmpfile1, $tmpfile2);
plan skip_all => "no access to symlink as this user"
     if !$ok && $! == &Errno::EPERM;

ok($ok, "create a dangling symbolic link");
ok(SPVM::Sys->l($tmpfile2), "-l sees it as a symlink");
SPVM::Sys->unlink($tmpfile2);

ok(mkdir($tmpfile1), "make a directory");
ok(!SPVM::Sys->l($tmpfile1), "doesn't look like a symlink");
SPVM::Sys->symlink($tmpfile1, $tmpfile2);
ok(SPVM::Sys->l($tmpfile2), "which does look like a symlink");
# ok(!-d _, "-d on the lstat result is false");
ok(SPVM::Sys::FileTest->d($tmpfile2), "normal -d sees it as a directory");
is(SPVM::Sys->readlink($tmpfile2), $tmpfile1, "readlink works");
check_stat($tmpfile1, $tmpfile2, "check directory and link stat are the same");
SPVM::Sys->unlink($tmpfile2);

# test our various name based directory tests
if (SPVM::Sys::OS->is_windows) {
    require Win32API::File; Win32API::File->import(qw(GetFileAttributes FILE_ATTRIBUTE_DIRECTORY
                          INVALID_FILE_ATTRIBUTES));
    # we can't use lstat() here, since the directory && symlink state
    # can't be preserved in it's result, and normal stat would
    # follow the link (which is broken for most of these)
    # GetFileAttributes() doesn't follow the link and can present the
    # directory && symlink state
    my @tests =
        (
         "x:",
         "x:\\",
         "x:/",
         "unknown\\",
         "unknown/",
         ".",
         "..",
        );
    for my $path (@tests) {
        SPVM::Sys->symlink($path, $tmpfile2);
        my $attr = GetFileAttributes($tmpfile2);
        ok($attr != INVALID_FILE_ATTRIBUTES() && ($attr & FILE_ATTRIBUTE_DIRECTORY()) != 0,
           "symlink $path: treated as a directory");
        SPVM::Sys->unlink($tmpfile2);
    }
}

# to check the unlink code for symlinks isn't mis-handling non-symlink
# directories
eval { SPVM::Sys->unlink($tmpfile1); };
ok($@, "we can't unlink the original directory");

SPVM::Sys->rmdir($tmpfile1);

ok(open(my $fh, ">", $tmpfile1), "make a file");
close $fh if $fh;
SPVM::Sys->symlink($tmpfile1, $tmpfile2);
ok(SPVM::Sys->l($tmpfile2), "-l sees a link");
# ok(!-f _, "-f on the lstat result is false");
ok(SPVM::Sys::FileTest->f($tmpfile2), "normal -f sees it as a file");
is(SPVM::Sys->readlink($tmpfile2), $tmpfile1, "readlink works");
check_stat($tmpfile1, $tmpfile2, "check file and link stat are the same");
SPVM::Sys->unlink($tmpfile2);

# make a relative link
{
  my $tmpfile1 = basename $tmpfile1;
  my $tmpdir = dirname $tmpfile1;
  
  my $original_dir = getcwd;
  
  chdir $tmpdir or die;
  unlike($tmpfile1, qr([\\/]), "temp filename has no path");
  SPVM::Sys->symlink("./$tmpfile1", $tmpfile2);
  ok(SPVM::Sys::FileTest->f($tmpfile2), "we can see it through the link");
  SPVM::Sys->unlink($tmpfile2);
  chdir $tmpdir or die;
}

SPVM::Sys->unlink($tmpfile1);

# test we don't treat directory junctions like symlinks
ok(mkdir($tmpfile1), "make a directory");

# mklink is available from Vista onwards
# this may only work in an admin shell
# MKLINK [[/D] | [/H] | [/J]] Link Target
if (SPVM::Sys::OS->is_windows) {
  if (system("mklink /j $tmpfile2 $tmpfile1") == 0) {
      ok(SPVM::Sys->l($tmpfile2), "junction does look like a symlink");
      like(SPVM::Sys->readlink($tmpfile2), qr/\Q$tmpfile1\E$/,
           "readlink() works on a junction");
      ok(SPVM::Sys->unlink($tmpfile2), "unlink magic for junctions");
  }
}

rmdir($tmpfile1);

{
    # link to an absolute path to a directory
    # 20533
    my $cwd = getcwd();
    SPVM::Sys->symlink($cwd, $tmpfile1);
    ok(-d $tmpfile1, "the link looks like a directory");
    SPVM::Sys->unlink($tmpfile1);
}

sub check_stat {
  my ($file1, $file2, $name) = @_;

  my $stat1 = SPVM::Sys->stat($file1);
  my $stat2 = SPVM::Sys->stat($file2);

  is($stat1->st_dev, $stat2->st_dev, "st_dev");
  is($stat1->st_ino, $stat2->st_ino, "st_ino");
  is($stat1->st_mode, $stat2->st_mode, "st_mode");
  is($stat1->st_nlink, $stat2->st_nlink, "st_nlink");
  is($stat1->st_uid, $stat2->st_uid, "uid");
  is($stat1->st_gid, $stat2->st_gid, "gid");
  is($stat1->st_rdev, $stat2->st_rdev, "rdev");
  is($stat1->st_size, $stat2->st_size, "size");
  if ($stat1->st_atime == $stat2->st_atime) {
    is($stat1->st_atime, $stat2->st_atime, "atime");
  }
  else {
    warn "[Test Output]st_atime different,file1: " . $stat1->st_atime . ",file2: " . $stat2->st_atime;
  }
  if ($stat1->st_mtime == $stat2->st_mtime) {
    is($stat1->st_mtime, $stat2->st_mtime, "mtime");
  }
  else {
    warn "[Test Output]st_mtime different,file1: " . $stat1->st_mtime . ",file2: " . $stat2->st_mtime;
  }
  if ($stat1->st_ctime == $stat2->st_ctime) {
    is($stat1->st_ctime, $stat2->st_ctime, "ctime");
  }
  else {
    warn "[Test Output]st_ctime different,file1: " . $stat1->st_ctime . ",file2: " . $stat2->st_ctime;
  }
}

done_testing();
