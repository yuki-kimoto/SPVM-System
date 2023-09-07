package SPVM::Sys;

our $VERSION = "0.486";

1;

=head1 Name

SPVM::Sys - System Calls for File IO, User, Process, Signal, Socket

=head1 Description

C<SPVM::Sys> is the C<Sys> class in L<SPVM> language. It provides system calls such as file IO, user manipulation, process, socket, time,

This class provides methods compatible with functions related to system calls provided by Perl.

This distribution contains many modules for system calls such as L<Sys::IO|SPVM::Sys::IO>, L<Sys::Socket|SPVM::Sys::Socket>, L<Sys::Process|SPVM::Sys::Process>. See L</"Modules">.

Methods compatible with file IO, sockets, file paths, current directory, select, and poll are implemented as other modules such as L<IO::File|SPVM::IO::File>, L<IO::Socket|SPVM::IO::Socket>, L<Cwd|SPVM::Cwd>. See L</"See Also">.

=head1 Usage

  use Sys;
  
  Sys->mkdir("foo");
  
  Sys->rmdir("foo");
  
  my $path = Sys->env("PATH");
  
  my $process_id = Sys->getpid;

=head1 Class Methods

=head2 env

  static method env : string ($name : string);

Gets an environment variable. The same as getting of the Perl L<$ENV{$name}|https://perldoc.perl.org/perlvar#%25ENV>.

=head2 osname

  static method osname : string ()

Gets OS name. The same as Perl L<$^O|https://perldoc.perl.org/perlvar#$%5EO>.

Currently the following OS names are supported.

=over 2

=item * C<linux>

=item * C<darwin>

=item * C<MSWin32>

=item * C<freebsd>

=item * C<openbsd>

=item * C<solaris>

=back

=head2 A

  static method A : double ($file : string);

Script start time minus file access time, in days. The same as Perl L<-A|https://perldoc.perl.org/functions/-X>.

=head2 C

  static method C : double ($file : string);

Script start time minus file inode change time, in days. The same as Perl L<-C|https://perldoc.perl.org/functions/-X>.

=head2 M

  static method M : double ($file : string);

Script start time minus file modification time, in days. The same as Perl L<-M|https://perldoc.perl.org/functions/-X>.

=head2 O

  static method O : int ($file : string);

File is owned by real uid. The same as Perl L<-O|https://perldoc.perl.org/functions/-X>.

=head2 R

  static method R : int ($file : string);

File is readable by real uid/gid. The same as Perl L<-R|https://perldoc.perl.org/functions/-X>.

=head2 S

  static method S : int ($file : string);

File is a socket. The same as Perl L<-S|https://perldoc.perl.org/functions/-X>.

=head2 W

  static method W : int ($file : string);

File is writable by real uid/gid. The same as Perl L<-W|https://perldoc.perl.org/functions/-X>.

=head2 X

  static method X : int ($file : string);

File is executable by real uid/gid. The same as Perl L<-X|https://perldoc.perl.org/functions/-X>.

=head2 b

  static method b : int ($file : string);

File is a block special file. The same as Perl L<-b|https://perldoc.perl.org/functions/-X>.

=head2 c

  static method c : int ($file : string);

File is a character special file. The same as Perl L<-c|https://perldoc.perl.org/functions/-X>.

=head2 d

  static method d : int ($file : string);

File is a directory. The same as Perl L<-d|https://perldoc.perl.org/functions/-X>.

=head2 e

  static method e : int ($file : string);

File exists. The same as Perl L<-e|https://perldoc.perl.org/functions/-X>.

=head2 f

  static method f : int ($file : string);

File is a plain file. The same as Perl L<-f|https://perldoc.perl.org/functions/-X>.

=head2 g

  static method g : int ($file : string);

File has setgid bit set. The same as Perl L<-g|https://perldoc.perl.org/functions/-X>.

=head2 k

  static method k : int ($file : string);

File has sticky bit set. The same as Perl L<-k|https://perldoc.perl.org/functions/-X>.

=head2 l

  static method l : int ($file : string);

File is a symbolic link (false if symlinks aren't supported by the file system). The same as Perl L<-l|https://perldoc.perl.org/functions/-X>.

=head2 o

  static method o : int ($file : string);

File is owned by effective uid. The same as Perl L<-l|https://perldoc.perl.org/functions/-X>.

=head2 p

  static method p : int ($file : string);

File is a named pipe (FIFO), or Filehandle is a pipe. The same as Perl L<-p|https://perldoc.perl.org/functions/-X>.

=head2 r

  static method r : int ($file : string);

File is readable by effective uid/gid. The same as Perl L<-r|https://perldoc.perl.org/functions/-X>.

=head2 s

  static method s : long ($file : string);

File has nonzero size (returns size in bytes). The same as Perl L<-s|https://perldoc.perl.org/functions/-X>.

=head2 u

  static method u : int ($file : string);

File has setuid bit set. The same as Perl L<-u|https://perldoc.perl.org/functions/-X>.

=head2 w

  static method w : int ($file : string);

File is writable by effective uid/gid. The same as Perl L<-u|https://perldoc.perl.org/functions/-X>.

=head2 x

  static method x : int ($file : string);

File is executable by effective uid/gid. The same as Perl L<-x|https://perldoc.perl.org/functions/-X>.

=head2 z

  static method z : int ($file : string);

File has zero size (is empty). The same as Perl L<-z|https://perldoc.perl.org/functions/-X>.

=head2 time

  static method time : long ();

Returns the number of non-leap seconds since whatever time the system considers to be the epoch, suitable for feeding to gmtime and localtime. The same as the Perl L<time|https://perldoc.perl.org/functions/time>. 

=head2 localtime

  static method localtime : Sys::Time::Tm ($time : long);

Converts a time as returned by the time function to a L<Sys::Time::Tm|SPVM::Sys::Time::Tm> object with the time analyzed for the local time zone. The same as the Perl L<localtime|https://perldoc.perl.org/functions/localtime>.

=head2 gmtime

  static method gmtime : Sys::Time::Tm ($time : long);

Works just like localtime, but the returned values are localized for the standard Greenwich time zone. The same as the Perl L<gmtime|https://perldoc.perl.org/functions/gmtime>.

=head2 process_id

  static method process_id : int ();

Gets the process number of the running this program. The same as the Perl L<$$|https://perldoc.perl.org/perlvar#$PROCESS_ID>.

=head2 stat

  static method stat : Sys::IO::Stat ($path : string);

Returns a L<Sys::IO::Stat|SPVM::Sys::IO::Stat> object giving the status info for a file. The same as the Perl L<stat|https://perldoc.perl.org/functions/stat> function.

=head2 fstat

  static method fstat : Sys::IO::Stat ($fd : int);

Returns a L<Sys::IO::Stat|SPVM::Sys::IO::Stat> object giving the status info for a file descriptor. The same as the Perl L<stat|https://perldoc.perl.org/functions/stat> function.

=head2 chdir

  static method chdir : int ($path : string);

Changes the working directory to $path. The same as the Perl L<chdir|https://perldoc.perl.org/functions/chdir> function.

If succeed, returns 1.

=head2 chmod

  static method chmod : int ($mode :int, $path : string);

Changes the permissions of a file. The same as the Perl L<chmod|https://perldoc.perl.org/functions/chmod> function.

If succeed, returns 1.

=head2 mkdir

  static method mkdir : int ($path : string, $mode : int);

Creates the directory specified by $path and $mode. The same as the Perl L<mkdir|https://perldoc.perl.org/functions/mkdir> function.

If succeed, returns 1.

=head2 umask

  static method umask : int ($mode : int);

Sets the umask for the process to $mode and returns the previous value. The same as the Perl L<umask|https://perldoc.perl.org/functions/umask> function.

=head2 rmdir

  static method rmdir : int ($path : string);

Deletes the directory specified by $path. The same as the Perl L<rmdir|https://perldoc.perl.org/functions/rmdir> function.

If succeed, returns 1.

=head2 opendir

  static method opendir : int ($dh_ref : Sys::IO::DirStream[], $dir : string);

Calls the L<opendir|SPVM::Sys::IO/"opendir"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

The return value is set to $dh_ref->[0].

If succeed, returns 1.

=head2 closedir

  static method closedir : int ($dirp : Sys::IO::DirStream);

Calls the L<opendir|SPVM::Sys::IO/"opendir"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

If succeed, returns 1.

=head2 unlink

  static method unlink : int ($pathname : string);

Deletes a file. The same as the Perl L<unlink|https://perldoc.perl.org/functions/unlink> function.

If succeed, returns 1.

=head2 rename

  static method rename : int ($oldpath : string, $newpath : string);

Changes the name of a file. The same as the Perl L<rename|https://perldoc.perl.org/functions/rename> function.

If succeed, returns 1.

=head2 readlink

  static method readlink : int ($file : string);

Returns the value of a symbolic link. The same as the Perl L<readlink|https://perldoc.perl.org/functions/readlink> function.

=head2 symlink

  static method symlink : int ($oldpath : string, $newpath : string);

Creates a $newpath symbolically linked to the $oldpath. The same as the Perl L<symlink|https://perldoc.perl.org/functions/symlink> function.

If succeed, returns 1.

=head2 sleep

  static method sleep : int ($seconds : int);

Causes the program to sleep for $seconds seconds. The same as the Perl L<sleep|https://perldoc.perl.org/functions/sleep>.

=head2 ioctl

  static method ioctl : int ($fd : int, $request : int, $request_arg_ref : object of byte[]|short[]|int[]|long[]|float[]|double[]|object = undef);

Calls the L<ioctlsocket|SPVM::Sys::Ioctl/"ioctlsocket"> method in the L<Sys::Ioctl|SPVM::Sys::Ioctl> class in Windows.

Calls the L<ioctl|SPVM::Sys::Ioctl/"ioctl"> method in the L<Sys::Ioctl|SPVM::Sys::Ioctl> class in other systems.

=head2 select

  static method select : int ($readfds : Sys::Select::Fd_set, $writefds : Sys::Select::Fd_set, $exceptfds : Sys::Select::Fd_set, $timeout : Sys::Time::Timeval);

Calls the L<select|SPVM::Sys::Select/"select"> method in the L<Sys::Select|SPVM::Sys::Select> class with the $ndfs set to 1024.

=head2 bind

  static method bind : int ($sockfd : int, $addr : Sys::Socket::Sockaddr);

The next argument $addrlen is set to the size of the $addr.

Calls the L<bind|SPVM::Sys::Socket/"bind"> method in the L<Sys::Socket|SPVM::Sys::Socket> class with the $addrlen.

If succeed, returns 1.

=head2 listen

  static method listen : int ($sockfd : int, $backlog : int);

Calls the L<listen|SPVM::Sys::Socket/"listen"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

If succeed, returns 1.

=head2 accept

  static method accept : Sys::Socket::Sockaddr ($new_sockfd_ref : int*, $sockfd : int);

The next argument $addrlen is set to 128.

Calls the L<accept|SPVM::Sys::Socket/"accept"> method in the L<Sys::Socket|SPVM::Sys::Socket> class with $addrlen,
and returns the $addr.

The original return value is set to $$new_sockfd_ref.

=head2 connect

  static method connect : int ($sockfd : int, $addr : Sys::Socket::Sockaddr);

The next argument $addrlen is set to the size of the $addr.

Calls the L<connect|SPVM::Sys::Socket/"connect"> method in the L<Sys::Socket|SPVM::Sys::Socket> class with the $addrlen.

If succeed, returns 1.

=head2 getpeername

  static method getpeername : Sys::Socket::Sockaddr ($sockfd : int);

The next argument $addrlen is set to 128.

Calls the L<getpeername|SPVM::Sys::Socket/"getpeername"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

The return valus is convert to a child L<Sys::Socket::Sockaddr|SPVM::Sys::Socket::Sockaddr> object
using L<to_family_sockaddr|SPVM::Sys::Socket/"to_family_sockaddr"> method in the L<Sys:Socket|SPVM::Sys::Socket> class.

=head2 getsockname

  static method getsockname : Sys::Socket::Sockaddr ($sockfd : int)

The next argument $addrlen is set to 128.

Calls the L<getsockname|SPVM::Sys::Socket/"getsockname"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

The return valus is convert to a child L<Sys::Socket::Sockaddr|SPVM::Sys::Socket::Sockaddr> object
using L<to_family_sockaddr|SPVM::Sys::Socket/"to_family_sockaddr"> method in the L<Sys:Socket|SPVM::Sys::Socket> class.

=head2 recv

  static method recv : int ($sockfd : int, $buf : mutable string, $len : int, $flags : int, $buf_offset : int = 0);

Calls the L<recv|SPVM::Sys::Socket/"recv"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

=head2 send

  static method send : int ($sockfd : int, $buf : string, $len : int, $flags : int, $buf_offset : int = 0);

Calls the L<send|SPVM::Sys::Socket/"send"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

=head2 shutdown

  static method shutdown : int ($sockfd : int, $how : int);

Calls the L<shutdown|SPVM::Sys::Socket/"shutdown"> method in the L<Sys::Socket|SPVM::Sys::Socket> class.

If succeed, returns 1.

=head2 socket

  static method socket : void ($sockfd_ref : int*, $domain : int, $type : int, $protocol : int);

Calls the L<socket|SPVM::Sys::Socket/"socket"> method in the L<Sys::Socket|SPVM::Sys::Socket> class with the $domain, $type, $protocal,
and the return value is set to $$sockfd_ref.

=head2 socketpair

  static method socketpair : int ($sock_fd1_ref : int*, $sock_fd2_ref : int*, $domain : int, $type : int, $protocol : int);

Creates a new int array with the length 2 for the next argument $pair.

Calls the L<socketpair|SPVM::Sys::Socket/"socketpair"> method in the L<Sys::Socket|SPVM::Sys::Socket> class with the $pair,
and the $$sock_fd1_ref is set the first element of the $pair, and the $$sock_fd2_ref is set the second element of the $pair, nad 

If succeed, returns 1.

=head2 setsockopt

  static method setsockopt : int ($sockfd : int, $level : int, $optname : int, $optval : object of string|Int);

If the $optval is the L<Int|SPVM::Int> type, a string for the next argument $optval is created by the length 4.

If the $optval is the string type, a string that for the next argument $optval is created by the length of the $optval.

Calls the L<getsockopt|SPVM::Sys::Socket/"getsockopt"> method in the L<Sys::Socket|SPVM::Sys::Socket> class
with the $optval and $optlen.

If succeed, returns 1.

Exceptions:

The $optval must be defined. Otherwise an exception is thrown.

The type of $optval must be Int or string. Otherwise an exception is thrown.

=head2 getsockopt

  static method getsockopt : string ($sockfd : int, $level : int, $optname : int, $optlen : int = -1);

If the $optlen is less than 0, it is set to 4.

A string for the next argument $optval is created by the length $optlen.

Calls the L<getsockopt|SPVM::Sys::Socket/"getsockopt"> method in the L<Sys::Socket|SPVM::Sys::Socket> class
with the $optval and $optlen, and the $optval set by this method is returnd.

=head2 truncate

  static method truncate : int ($fd : int, $legnth : long);

Calls the L<ftruncate|SPVM::Sys::IO/"ftruncate"> method in the L<Sys::IO|SPVM::Sys::IO> class.

If succeed, returns 1.

=head1 Modules

All modules included in this distribution. These classes have methods that directly correspond to Linux/Unix/Mac or Windows system call functions written in C. In addition, several helper methods are implemented.

=head2 Sys::Env

=head4 L<Sys::Env|SPVM::Sys::Env>

=head2 Sys::IO

=head4 L<Sys::IO|SPVM::Sys::IO>

=head4 L<Sys::IO::Constant|SPVM::Sys::IO::Constant>

=head4 L<Sys::IO::Dirent|SPVM::Sys::IO::Dirent>

=head4 L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>

=head4 L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>

=head4 L<Sys::IO::Flock|SPVM::Sys::IO::Flock>

=head4 L<Sys::IO::Stat|SPVM::Sys::IO::Stat>

=head4 L<Sys::IO::Utimbuf|SPVM::Sys::IO::Utimbuf>

=head2 Sys::Ioctl

=head4 L<Sys::Ioctl|SPVM::Sys::Ioctl>

=head4 L<Sys::Ioctl::Constant|SPVM::Sys::Ioctl::Constant>

=head2 Sys::OS

=head4 L<Sys::OS|SPVM::Sys::OS>

=head2 Sys::Poll

=head4 L<Sys::Poll|SPVM::Sys::Poll>

=head4 L<Sys::Poll::Constant|SPVM::Sys::Poll::Constant>

=head4 L<Sys::Poll::PollfdArray|SPVM::Sys::Poll::PollfdArray>

=head2 Sys::Process

=head4 L<Sys::Process|SPVM::Sys::Process>

=head4 L<Sys::Process::Constant|SPVM::Sys::Process::Constant>

=head2 Sys::Select

=head4 L<Sys::Select|SPVM::Sys::Select>

=head4 L<Sys::Select::Constant|SPVM::Sys::Select::Constant>

=head4 L<Sys::Select::Fd_set|SPVM::Sys::Select::Fd_set>

=head2 Sys::Signal

=head4 L<Sys::Signal|SPVM::Sys::Signal>

=head4 L<Sys::Signal::Constant|SPVM::Sys::Signal::Constant>

=head4 L<Sys::Signal::Handler|SPVM::Sys::Signal::Handler>

=head4 L<Sys::Signal::Handler::Default|SPVM::Sys::Signal::Handler::Default>

=head4 L<Sys::Signal::Handler::Ignore|SPVM::Sys::Signal::Handler::Ignore>

=head4 L<Sys::Signal::Handler::Monitor|SPVM::Sys::Signal::Handler::Monitor>

=head4 L<Sys::Signal::Handler::Unknown|SPVM::Sys::Signal::Handler::Unknown>

=head2 Sys::Socket

=head4 L<Sys::Socket::Util|SPVM::Sys::Socket::Util>

=head4 L<Sys::Socket|SPVM::Sys::Socket>

=head4 L<Sys::Socket::Addrinfo|SPVM::Sys::Socket::Addrinfo>

=head4 L<Sys::Socket::AddrinfoLinkedList|SPVM::Sys::Socket::AddrinfoLinkedList>

=head4 L<Sys::Socket::Constant|SPVM::Sys::Socket::Constant>

=head4 L<Sys::Socket::Error|SPVM::Sys::Socket::Error>

=head4 L<Sys::Socket::Error::InetInvalidNetworkAddress|SPVM::Sys::Socket::Error::InetInvalidNetworkAddress>

=head4 L<Sys::Socket::In6_addr|SPVM::Sys::Socket::In6_addr>

=head4 L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr>

=head4 L<Sys::Socket::In_addr_base|SPVM::Sys::Socket::In_addr_base>

=head4 L<Sys::Socket::Ip_mreq|SPVM::Sys::Socket::Ip_mreq>

=head4 L<Sys::Socket::Ip_mreq_source|SPVM::Sys::Socket::Ip_mreq_source>

=head4 L<Sys::Socket::Ipv6_mreq|SPVM::Sys::Socket::Ipv6_mreq>

=head4 L<Sys::Socket::Sockaddr|SPVM::Sys::Socket::Sockaddr>

=head4 L<Sys::Socket::Sockaddr::In|SPVM::Sys::Socket::Sockaddr::In>

=head4 L<Sys::Socket::Sockaddr::In6|SPVM::Sys::Socket::Sockaddr::In6>

=head4 L<Sys::Socket::Sockaddr::Interface|SPVM::Sys::Socket::Sockaddr::Interface>

=head4 L<Sys::Socket::Sockaddr::Storage|SPVM::Sys::Socket::Sockaddr::Storage>

=head4 L<Sys::Socket::Sockaddr::Un|SPVM::Sys::Socket::Sockaddr::Un>

=head2 Sys::Time

=head4 L<Sys::Time|SPVM::Sys::Time>

=head4 L<Sys::Time::Constant|SPVM::Sys::Time::Constant>

=head4 L<Sys::Time::Itimerval|SPVM::Sys::Time::Itimerval>

=head4 L<Sys::Time::Timespec|SPVM::Sys::Time::Timespec>

=head4 L<Sys::Time::Timeval|SPVM::Sys::Time::Timeval>

=head4 L<Sys::Time::Timezone|SPVM::Sys::Time::Timezone>

=head4 L<Sys::Time::Tms|SPVM::Sys::Time::Tm>

=head4 L<Sys::Time::Tms|SPVM::Sys::Time::Tms>

=head2 Sys::User

=head4 L<Sys::User|SPVM::Sys::User>

=head4 L<Sys::User::Group|SPVM::Sys::User::Group>

=head4 L<Sys::User::Passwd|SPVM::Sys::User::Passwd>

=head2 Sys::FileTest

=head4 L<Sys::FileTest|SPVM::Sys::FileTest> (Deparecated)

=head1 See Also

=head4 L<IO::File|SPVM::IO::File>

=head4 L<IO::Socket|SPVM::IO::Socket>

=head4 L<IO::Select|SPVM::IO::Select>

=head4 L<IO::Poll|SPVM::IO::Poll>

=head4 L<File::Spec|SPVM::File::Spec>

=head4 L<Cwd|SPVM::Cwd>

=head1 Author

Yuki Kimoto(L<https://github.com/yuki-kimoto>)

=head1 Contributors

Gabor Szabo(L<https://github.com/szabgab>)

=head1 Repository

L<SPVM::Sys - Github|https://github.com/yuki-kimoto/SPVM-Sys>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

