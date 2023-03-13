package SPVM::Sys;

our $VERSION = '0.42';

1;

=head1 Name

SPVM::Sys - System Calls for File IO, User, Process, Signal, Socket

=head1 Description

C<SPVM::Sys> is the C<Sys> class in L<SPVM> language. It provides system calls such as file IO, user manipulation, process, socket, time,

This distribution contains many modules for system calls such as L<Sys::IO|SPVM::Sys::IO>. See L</"Modules">.

=head1 Usage

  use Sys;
  
  my $path = Sys->getenv("PATH");
  
=head1 Class Methods

=head2 getenv

  static method getenv : string ($name : string);

Gets an environment variable. The same as getting of the Perl L<$ENV{$name}|https://perldoc.perl.org/perlvar#%25ENV>.

=head2 setenv

  static method setenv : int ($name : string, $value : string, $overwrite : int);

Sets an environment variable. The same as setting of the Perl L<$ENV{$name}|https://perldoc.perl.org/perlvar#%25ENV>.

=head2 unsetenv

  static method unsetenv : int ($name : string);

Deletes an environment variable. The same as deleting of the Perl L<$ENV{$name}|https://perldoc.perl.org/perlvar#%25ENV>.

=head2 osname

  static method osname : string ()

Gets OS name. The same as Perl L<$^O|https://perldoc.perl.org/perlvar#$%5EO>.

Currently the following OS names are supported.

=over 2

=item * linux

=item * darwin

=item * MSWin32

=item * freebsd

=item * openbsd

=item * solaris

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

=head2 ioctl

  static method ioctl : int ($fd : int, $request : int, $request_arg = undef : object of Byte|Short|Int|Long|Float|Double|object);

=head2 getuid

  static method getuid : int ();

=head2 geteuid

  static method geteuid : int ();

=head2 getgid

  static method getgid : int ();

=head2 getegid

  static method getegid : int ();

=head2 setuid

  static method setuid : int ($uid : int);

=head2 seteuid

  static method seteuid : int ($euid : int);

=head2 setgid

  static method setgid : int ($gid : int);

=head2 setegid

  static method setegid : int ($egid : int);

=head2 setpwent

  static method setpwent : void ();

=head2 endpwent

  static method endpwent : void ();

=head2 getpwent

  static method getpwent : Sys::User::Passwd ();

=head2 setgrent

  static method setgrent : void ();

=head2 endgrent

  static method endgrent : void ();

=head2 getgrent

  static method getgrent : Sys::User::Group ();

=head2 getgroups

  static method getgroups : int[] ();

=head2 setgroups

  static method setgroups : int ($groups : int[]);

=head2 getpwuid

  static method getpwuid : Sys::User::Passwd ($id : int);

=head2 getpwnam

  static method getpwnam : Sys::User::Passwd ($name : string);

=head2 getgrgid

  static method getgrgid : Sys::User::Group ($id : int);

=head2 getgrnam

  static method getgrnam : Sys::User::Group ($name : string);

=head2 times

  static method times : Sys::Time::Tms ();

=head2 time

  static method time : long ();

=head2 localtime

  static method localtime : Time::Info ($time : long);

=head2 gmtime

  static method gmtime : Time::Info ($time : long);

=head2 getpriority

  static method getpriority : int ($which : int, $who : int);

=head2 setpriority

  static method setpriority : int ($which : int, $who : int, $prio : int);

=head2 sleep

  static method sleep : int ($seconds : int);

=head2 

  static method wait : int ($wstatus_ref : int*);

=head2 waitpid

  static method waitpid : int ($pid : int, $wstatus_ref : int*, $options : int);

=head2 system

  static method system : int ($command : string);

=head2 exit

  static method exit : int ($status : int);

=head2 pipe

  static method pipe : int ($pipe_fds : int[]);

=head2 getpgid

  static method getpgid : int ($pid : int);

=head2 setpgid

  static method setpgid : int ($pid : int, $pgid : int);

=head2 getpid

  static method getpid : int ();

=head2 getppid

  static method getppid : int ();

=head2 exec

  static method exec : int ($path : string, $args : string[]);

=head2 stat

  static method stat : Sys::IO::Stat ($path : string);

=head2 lstat

  static method lstat : Sys::IO::Stat ($path : string);

=head2 mkdir

  static method mkdir : int ($path : string, $mode : int) {

=head2 umask

  static method umask : int ($mode : int) {

=head2 rmdir

  static method rmdir : int ($path : string) {

=head2 unlink

  static method unlink : int ($pathname : string) {

=head2 rename

  static method rename : int ($oldpath : string, $newpath : string) {

=head2 symlink

  static method symlink : int ($oldpath : string, $newpath : string) {

=head2 readlink

  static method readlink : int ($file : string) {

=head2 chdir

  static method chdir : int ($path : string) {

=head2 chmod

  static method chmod : int ($mode :int, $path : string) {

=head2 chown

  static method chown : int ($owner : int, $group : int, $path : string) {

=head2 symlink

  static method symlink : int ($oldpath : string, $newpath : string) {

=head2 opendir

  static method opendir : Sys::IO::DirStream ($dir : string) {

=head2 closedir

  static method closedir : int ($dirp : Sys::IO::DirStream) {

=head2 readdir

  static method readdir : Sys::IO::Dirent ($dirp : Sys::IO::DirStream) {

=head2 rewinddir

  static method rewinddir : void ($dirp : Sys::IO::DirStream) {

=head2 telldir

  static method telldir : long ($dirp : Sys::IO::DirStream) {

=head2 seekdir

  static method seekdir : void ($dirp : Sys::IO::DirStream, $offset : long) {

=head2 utime

  static method utime : int ($atime : long, $mtime : long, $filename : string) {

=head1 Modules

All modules included in this distribution.

=head2 Sys::Env

=head4 L<Sys::Env|SPVM::Sys::Env>

=head2 Sys::FileTest

=head4 L<Sys::FileTest|SPVM::Sys::FileTest>

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

=head4 L<Sys::Socket|SPVM::Sys::Socket>

=head4 L<Sys::Socket::Addrinfo|SPVM::Sys::Socket::Addrinfo>

=head4 L<Sys::Socket::AddrinfoLinkedList|SPVM::Sys::Socket::AddrinfoLinkedList>

=head4 L<Sys::Socket::Constant|SPVM::Sys::Socket::Constant>

=head4 L<Sys::Socket::Error|SPVM::Sys::Socket::Error>

=head4 L<Sys::Socket::Error::InetInvalidNetworkAddress|SPVM::Sys::Socket::Error::InetInvalidNetworkAddress>

=head4 L<Sys::Socket::In6_addr|SPVM::Sys::Socket::In6_addr>

=head4 L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr>

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

=head4 L<Sys::Time::Tms|SPVM::Sys::Time::Tms>

=head2 Sys::User

=head4 L<Sys::User|SPVM::Sys::User>

=head4 L<Sys::User::Group|SPVM::Sys::User::Group>

=head4 L<Sys::User::Passwd|SPVM::Sys::User::Passwd>

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

Copyright Yuki Kimoto 2022-2022, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
