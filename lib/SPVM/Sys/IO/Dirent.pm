package SPVM::Sys::IO::Dirent;

1;

=head1 Name

SPVM::Sys::IO::Dirent - struct dirent in the C language

=head1 Usage
  
  use Sys;
  
  my $dirent = Sys->readdir($dir);
  
  my $d_ino = $dirent->d_ino;
  
  my $d_name = $dirent->d_name;

=head1 Description

The Sys::IO::Dirent class of L<SPVM> represents C<struct dirent > in the C language.

=head1 Pointer Class

This class is a L<pointer class|SPVM::Document::Language/"Pointer Class">.

=head1 Class Methods

=head2 d_ino

C<method d_ino : int ();>

Gets C<d_ino>.

=head2 d_reclen

C<method d_reclen : int ();>

Gets C<d_reclen>.

=head2 d_name

C<method d_name : string ();>

Gets and copies C<d_name> and returns it.

=head2 d_off

C<method d_off : long;>

Gets C<d_off>.

=head2 d_type

C<method d_type : int ();>

Gets C<d_type>.

=head1 See Also

=over 2

=item * L<readdir|SPVM::Sys/"readdir"> in Sys.

=item * L<readdir|SPVM::Sys::IO/"readdir"> in Sys::IO.

=back

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

