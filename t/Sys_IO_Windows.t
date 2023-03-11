use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use File::Temp ();

use Errno;
use Cwd qw(getcwd);

use SPVM 'Sys::IO';
use SPVM 'Sys::IO::Windows';
use SPVM 'Sys::FileTest';

Win32::FsType() eq 'NTFS'
    or skip_all("need NTFS");

my $symlink_supported;
eval { SPVM::Sys::IO->symlinkp('', '') };
if ($@ && $@ =~ /\Q[System Error]win32_symlink/) {
  $symlink_supported = 1;
}
plan skip_all => "no symlink available in this Windows"
    if !$symlink_supported;

my $tmp_dir = File::Temp->newdir;

my $tmpfile1 = "$tmp_dir/file1";
my $tmpfile2 = "$tmp_dir/file2";

warn "$tmpfile1 $tmpfile2";

my $ok = SPVM::Sys::IO->symlinkp($tmpfile1, $tmpfile2);
plan skip_all => "no access to symlink as this user"
     if !$ok && $! == &Errno::EPERM;

ok($ok, "create a dangling symbolic link");
ok(SPVM::Sys::IO::Windows->is_symlink($tmpfile2), "-l sees it as a symlink");
ok(SPVM::Sys::IO::Windows->unlink($tmpfile2), "and remove it");

ok(mkdir($tmpfile1), "make a directory");
ok(!SPVM::Sys::IO::Windows->is_symlink($tmpfile1), "doesn't look like a symlink");
ok(SPVM::Sys::IO->symlinkp($tmpfile1, $tmpfile2), "and symlink to it");
ok(SPVM::Sys::IO::Windows->is_symlink($tmpfile2), "which does look like a symlink");
# ok(!-d _, "-d on the lstat result is false");
ok(SPVM::Sys::FileTest->d($tmpfile2), "normal -d sees it as a directory");
is(SPVM::Sys::IO->readlinkp($tmpfile2), $tmpfile1, "readlink works");
check_stat($tmpfile1, $tmpfile2, "check directory and link stat are the same");
ok(SPVM::Sys::IO::Windows->unlink($tmpfile2), "and we can unlink the symlink (rather than only rmdir)");

# test our various name based directory tests
{
    use Win32API::File qw(GetFileAttributes FILE_ATTRIBUTE_DIRECTORY
                          INVALID_FILE_ATTRIBUTES);
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
        ok(SPVM::Sys::IO->symlinkp($path, $tmpfile2), "symlink $path");
        my $attr = GetFileAttributes($tmpfile2);
        ok($attr != INVALID_FILE_ATTRIBUTES && ($attr & FILE_ATTRIBUTE_DIRECTORY) != 0,
           "symlink $path: treated as a directory");
        SPVM::Sys::IO::Windows->unlink($tmpfile2);
    }
}

# to check the unlink code for symlinks isn't mis-handling non-symlink
# directories
ok(!SPVM::Sys::IO::Windows->unlink($tmpfile1), "we can't unlink the original directory");

ok(SPVM::Sys::IO->rmdir($tmpfile1), "we can rmdir it");

ok(open(my $fh, ">", $tmpfile1), "make a file");
close $fh if $fh;
ok(SPVM::Sys::IO->symlinkp($tmpfile1, $tmpfile2), "link to it");
ok(SPVM::Sys::IO::Windows->is_symlink($tmpfile2), "-l sees a link");
# ok(!-f _, "-f on the lstat result is false");
ok(SPVM::Sys::FileTest->f($tmpfile2), "normal -f sees it as a file");
is(SPVM::Sys::IO->readlinkp($tmpfile2), $tmpfile1, "readlink works");
check_stat($tmpfile1, $tmpfile2, "check file and link stat are the same");
ok(SPVM::Sys::IO::Windows->unlink($tmpfile2), "unlink the symlink");

# make a relative link
unlike($tmpfile1, qr([\\/]), "temp filename has no path");
ok(SPVM::Sys::IO->symlinkp("./$tmpfile1", $tmpfile2), "UNIX (/) relative link to the file");
ok(SPVM::Sys::FileTest->f($tmpfile2), "we can see it through the link");
ok(SPVM::Sys::IO::Windows->unlink($tmpfile2), "unlink the symlink");

ok(SPVM::Sys::IO::Windows->unlink($tmpfile1), "and the file");

# test we don't treat directory junctions like symlinks
ok(mkdir($tmpfile1), "make a directory");

# mklink is available from Vista onwards
# this may only work in an admin shell
# MKLINK [[/D] | [/H] | [/J]] Link Target
if (system("mklink /j $tmpfile2 $tmpfile1") == 0) {
    ok(SPVM::Sys::IO::Windows->is_symlink($tmpfile2), "junction does look like a symlink");
    like(SPVM::Sys::IO->readlinkp($tmpfile2), qr/\Q$tmpfile1\E$/,
         "readlink() works on a junction");
    ok(SPVM::Sys::IO::Windows->unlink($tmpfile2), "unlink magic for junctions");
}
rmdir($tmpfile1);

{
    # link to an absolute path to a directory
    # 20533
    my $cwd = getcwd();
    ok(SPVM::Sys::IO->symlinkp($cwd, $tmpfile1),
       "symlink to an absolute path to cwd");
    ok(-d $tmpfile1, "the link looks like a directory");
    SPVM::Sys::IO::Windows->unlink($tmpfile1);
}

done_testing();

sub check_stat {
    my ($file1, $file2, $name) = @_;

    my @stat1 = stat($file1);
    my @stat2 = stat($file2);

    is("@stat1", "@stat2", $name);
}