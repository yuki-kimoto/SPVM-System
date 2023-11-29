package SPVM::Sys::Select::Fd_set;

1;

=head1 Name

SPVM::Sys::Select::Fd_set - fd_set structure in C Language

=head1 Description

The Sys::Select::Fd_set class of L<SPVM> represents L<fd_set|https://linux.die.net/man/2/select> structure in the C language.

=head1 Usage

  use Sys::Select::Fd_set;
  
  my $fd_set = Sys::Select::Fd_set->new;

=head1 Class Methods

=head2 new

C<static method new : L<Sys::Select::Fd_set|SPVM::Sys::Select::Fd_set> ();>

Create a new L<Sys::Select::Fd_set|SPVM::Sys::Select::Fd_set> object.

=head1 Instance Methods

=head2 DESTROY

C<method DESTROY : void ();>

The destructor.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

