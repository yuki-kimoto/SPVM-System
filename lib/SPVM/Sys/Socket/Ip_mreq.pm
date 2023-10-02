package SPVM::Sys::Socket::Ip_mreq;

1;

=head1 Name

SPVM::Sys::Socket::Ip_mreq - struct ip_mreq in C language

=head1 Usage

  use Sys::Socket::Ip_mreq;

=head1 Description

C<Sys::Socket::In_addr> is the class for the C<struct ip_mreq> in C<C language>.

This is a L<pointer class|SPVM::Document::Language/"Pointer Class">.

=head1 Class Methods

=head2 new

C<static method new : L<Sys::Socket::Ip_mreq|SPVM::Sys::Socket::Ip_mreq> ();>

Create a new C<Sys::Socket::Ip_mreq> object.

=head1 Instance Methods

=head2 DESTROY

C<method DESTROY : void ();>

The destructor.

=head2 imr_multiaddr

C<method imr_multiaddr : L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> ();>

Get C<imr_multiaddr>. This is a L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> object.

=head2 set_imr_multiaddr

C<method set_imr_multiaddr : void ($address : L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr>);>

Set C<imr_multiaddr>. This is a L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> object.

=head2 imr_interface

C<method imr_interface : L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> ();>

Get C<imr_interface>. This is a L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> object.

=head2 set_imr_interface

C<method set_imr_interface : void ($interface : L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr>);>

Set C<imr_interface>. This is a L<Sys::Socket::In_addr|SPVM::Sys::Socket::In_addr> object.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

