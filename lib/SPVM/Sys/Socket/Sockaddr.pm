package SPVM::Sys::Socket::Sockaddr;

1;

=head1 Name

SPVM::Sys::Socket::Sockaddr - struct sockaddr in C language

=head1 Usage

  use Sys::Socket::Sockaddr;
  
=head1 Description

C<Sys::Socket::Sockaddr> is the class for the C<struct sockaddr> in C<C language>.

This is a L<pointer class|SPVM::Document::Language/"Pointer Class">.

=head1 Interfaces

=over 2

=item L<Cloneable|SPVM::Cloneable>

=back

=head1 Class Methods

=head2 new

C<static method new : L<Sys::Socket::Sockaddr::In|SPVM::Sys::Socket::Sockaddr::In> ();>

Create a new C<Sys::Socket::Sockaddr> object.

=head1 Instance Methods

=head2 DESTROY

C<method DESTROY : void ();>

The destructor.

=head2 sa_family

C<method sa_family : int ()>

Gets C<sa_family>.

=head2 set_sa_family

C<method sa_family : int ()>

Sets C<sa_family>.

=head2 sizeof

C<method size : int ()>

Returns the size of the structure. This method is planed to be implemented in a child class.

Exception:

  Not implemented.
  
=head2 clone

C<method clone : L<Sys::Socket::Sockaddr|SPVM::Sys::Socket::Sockaddr> ();>

Clones this object. This method is planed to be implemented in a child class.

Exception:

  Not implemented.
  
=head1 Well Known Child Classes

=over 2

=item L<Sys::Socket::Sockaddr::In|SPVM::Sys::Socket::Sockaddr::In>

=item L<Sys::Socket::Sockaddr::In6|SPVM::Sys::Socket::Sockaddr::In6>

=item L<Sys::Socket::Sockaddr::Un|SPVM::Sys::Socket::Sockaddr::Un>

=item L<Sys::Socket::Sockaddr::Storage|SPVM::Sys::Socket::Sockaddr::Storage>

=back

=head1 Copyright & License

Copyright 2022-2022 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

