use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use POSIX q(:sys_wait_h);

use SPVM 'Sys::Process';

use SPVM 'TestCase::Sys::Process';

# Start objects count
my $start_memory_blocks_count = SPVM::get_memory_blocks_count();

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->alarm };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->alarm);
}

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->fork };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->fork);
}

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->getpriority };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->getpriority);
}

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->setpriority };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->setpriority);
}

ok(SPVM::TestCase::Sys::Process->sleep);

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->kill };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->kill);
}

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->wait };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->wait);
}

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->waitpid };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->waitpid);
}


ok(SPVM::TestCase::Sys::Process->system);
unless ($^O eq 'MSWin32') {
  ok(SPVM::TestCase::Sys::Process->exit);
}
ok(SPVM::TestCase::Sys::Process->pipe);
{
  ok(SPVM::TestCase::Sys::Process->getpgrp);
  is(getpgrp(), SPVM::Sys::Process->getpgrp);
}
if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->setpgrp };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->setpgrp);
}

{
  ok(SPVM::TestCase::Sys::Process->getpid);
  is($$, SPVM::Sys::Process->getpid);
}
{
  ok(SPVM::TestCase::Sys::Process->getppid);
  is(getppid(), SPVM::Sys::Process->getppid);
}
ok(SPVM::TestCase::Sys::Process->execv);

if ($^O eq 'MSWin32') {
  eval { SPVM::Sys::Process->times };
  ok($@);
}
else {
  ok(SPVM::TestCase::Sys::Process->times);
}

# The exit status
{
  is(WIFEXITED(0), SPVM::Sys::Process->WIFEXITED(0));
  is(WEXITSTATUS(0), SPVM::Sys::Process->WEXITSTATUS(0));
  is(WIFSIGNALED(0), SPVM::Sys::Process->WIFSIGNALED(0));
  is(WTERMSIG(0), SPVM::Sys::Process->WTERMSIG(0));
  is(WIFSTOPPED(0), SPVM::Sys::Process->WIFSTOPPED(0));
  is(WSTOPSIG(0), SPVM::Sys::Process->WSTOPSIG(0));
  
  # Non-POSIX
  SPVM::Sys::Process->WIFCONTINUED(0);
  SPVM::Sys::Process->WCOREDUMP(0);
}

SPVM::set_exception(undef);

# All object is freed
my $end_memory_blocks_count = SPVM::get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
