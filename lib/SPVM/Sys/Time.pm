package SPVM::Sys::Time;

1;

=head1 Name

SPVM::Sys::Time - System Calls for Time Manipulation

=head1 Description

The Sys::Process class of L<SPVM> has methods to call system calls for time manipulation.

=head1 Usage
  
  use Sys::Time;

  my $epoch = Sys::Time->time;
  
  my $time_info_local = Sys::Time->localtime($epoch);
  
  my $time_info_utc = Sys::Time->gmtime($epoch);

=head1 Class Methods

=head2 time

  static method time : long ();

Gets the current epoch time. 

This method is the same as C<time> function of C<Linux>.

  my $epoch = Sys::Time->time;

=head2 localtime

  static method localtime : Sys::Time::Tm ($time : long);

Converts an epoch $time to the L<Sys::Time::Tm|SPVM::Sys::Time::Tm> object that is local time.

This method is the same as C<localtime> function of C<Linux>.

  my $time_info = Sys::Time->localtime($epoch);

=head2 gmtime

  static method gmtime : Sys::Time::Tm ($time : long);

Converts an epoch $time to the L<Sys::Time::Tm|SPVM::Sys::Time::Tm> object that is C<UTC>.

This method is the same as C<gmtime> function of C<Linux>.

  my $time_info = Sys::Time->gmtime($epoch);

=head2 gettimeofday

  static method gettimeofday : int ($tv : Sys::Time::Timeval, $tz : Sys::Time::Timezone);

The functions gettimeofday() can get the time as well as a timezone. The tv argument is a struct timeval (as specified in <sys/time.h>):

See L<gettimeofday(2) - Linux man page|https://linux.die.net/man/2/gettimeofday> in Linux.

=head2 clock

  static method clock : long ()

The value returned is the CPU time used so far as a clock_t; to get the number of seconds used, divide by CLOCKS_PER_SEC.

See L<clock(3) - Linux man page|https://linux.die.net/man/3/clock> in Linux.

=head2 clock_gettime

  static method clock_gettime : int ($clk_id : int, $tp : Sys::Time::Timespec);

The functions clock_gettime() retrieves the time of the specified clock clk_id.

See L<clock_gettime(3) - Linux man page|https://linux.die.net/man/3/clock_gettime> in Linux.

The C<$tp> is a L<Sys::Time::Timespec|SPVM::Sys::Time::Timespec> object.

=head2 clock_getres

  static method clock_getres : int ($clk_id : int, $res : Sys::Time::Timespec);

The functions clock_getres() retrieves the time of the specified clock clk_id.

See L<clock_getres(3) - Linux man page|https://linux.die.net/man/3/clock_getres> in Linux.

The C<$res> is a L<Sys::Time::Timespec|SPVM::Sys::Time::Timespec> object.

=head2 setitimer

  static method setitimer : int ($which : int, $new_value : Sys::Time::Itimerval, $old_value : Sys::Time::Itimerval)

The function setitimer() sets the specified timer to the value in new_value. If old_value is non-NULL, the old value of the timer is stored there.

See L<setitimer(2) - Linux man page|https://linux.die.net/man/2/setitimer> in Linux.

The C<$new_value> is a L<Sys::Time::Itimerval|SPVM::Sys::Time::Itimerval> object.

The C<$old_value> is a L<Sys::Time::Itimerval|SPVM::Sys::Time::Itimerval> object.

=head2 getitimer

  static method getitimer : int ($which : int, $curr_value : Sys::Time::Itimerval);

The function getitimer() fills the structure pointed to by curr_value with the current setting for the timer specified by which (one of ITIMER_REAL, ITIMER_VIRTUAL, or ITIMER_PROF).

See L<getitimer(2) - Linux man page|https://linux.die.net/man/2/getitimer> in Linux.

The C<$curr_value> is a L<Sys::Time::Itimerval|SPVM::Sys::Time::Itimerval> object.

=head2 times

  static method times : long ($buffer : Sys::Time::Tms);

times() stores the current process times in the struct tms that buf points to. The struct tms is as defined in <sys/times.h>:

See the detail of the L<times|https://linux.die.net/man/2/times> function in the case of Linux.

=head2 clock_nanosleep

  static method clock_nanosleep : int ($clockid : int, $flags : int, $request : Sys::Time::Timespec, $remain : Sys::Time::Timespec);

Like nanosleep(2), clock_nanosleep() allows the calling thread to sleep for an interval specified with nanosecond precision. It differs in allowing the caller to select the clock against which the sleep interval is to be measured, and in allowing the sleep interval to be specified as either an absolute or a relative value.

See the detail of the L<clock_nanosleep(2) - Linux man page|https://linux.die.net/man/2/clock_nanosleep> function in the case of Linux.

The C<$request> is a L<Sys::Time::Timespec|SPVM::Sys::Time::Timespec> object.

The C<$remain> is a L<Sys::Time::Timespec|SPVM::Sys::Time::Timespec> object.

=head2 nanosleep

  static method nanosleep : int ($rqtp : Sys::Time::Timespec, $rmtp : Sys::Time::Timespec);

The nanosleep() function shall cause the current thread to be suspended from execution until either the time interval specified by the rqtp argument has elapsed or a signal is delivered to the calling thread, and its action is to invoke a signal-catching function or to terminate the process.

See the detail of the L<nanosleep|https://linux.die.net/man/3/nanosleep> function in the case of Linux.

The rqtp is a L<Sys::Time::Timespec> object.

The rmtp is a L<Sys::Time::Timespec> object.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

