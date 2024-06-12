use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";

use Test::SPVM::Sys::Socket::Server::IP;
use Test::SPVM::Sys::Socket::Util;

# Port
my $port = Test::SPVM::Sys::Socket::Util::get_empty_port;

warn "[Test Output]Port:$port";

ok($port >= 20000);

{
  my $server = Test::SPVM::Sys::Socket::Server::IP->new(
    code => sub {
      my ($port) = @_;
      
      Test::SPVM::Sys::Socket::Util::run_echo_server($port);
    },
  );
}

ok(1);

done_testing;