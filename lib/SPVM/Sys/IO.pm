package SPVM::Sys::IO;

1;

=head1 Name

SPVM::Sys::IO - IO System Call

=head1 Usage
  
  use Sys::IO;

=head1 Description

C<Sys::IO> is the class for the file IO.

=head1 Class Methods

=head2 stdin

C<static method stdin : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns L<stdin|https://linux.die.net/man/3/stdin>.

=head2 stdout

C<static method stdout : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns L<stdout|https://linux.die.net/man/3/stdout>.

=head2 stderr

C<static method stderr : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns L<stderr|https://linux.die.net/man/3/stderr>.

=head2 spvm_stdin

C<static method spvm_stdin : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns the L<stdin|SPVM::Document::NativeAPI/"spvm_stdin"> opened by the SPVM language.

=head2 spvm_stdout

C<static method spvm_stdout : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns the L<stdout|SPVM::Document::NativeAPI/"spvm_stdout"> opened by the SPVM language.

=head2 spvm_stderr

C<static method spvm_stderr : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ();>

Returns the L<stderr|SPVM::Document::NativeAPI/"spvm_stderr"> opened by the SPVM language.

=head2 fopen

C<static method fopen : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ($path : string, $mode : string);>

Calls the L<fopen|https://linux.die.net/man/3/fopen> function and returns its return value.

Exceptions:

$path must be defined. Otherwise an exception is thrown.

$mode must be defined. Otherwise an exception is thrown.

If the fopen function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fdopen

C<static method fdopen : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ($fd : int, $mode : string);>

Calls the L<fdopen|https://linux.die.net/man/3/fdopen> function and returns its return value.

Exceptions:

$fd must be greater than or equal to 0. Otherwise an exception is thrown.

$mode must be defined. Otherwise an exception is thrown.

If the fdopen function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fileno

C<static method fileno : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<fileno|https://linux.die.net/man/3/fileno> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the fileno function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fread

C<static method fread : int ($ptr : mutable string, $size : int, $nmemb : int, $stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $ptr_offset : int = 0);>

Calls the L<fread|https://linux.die.net/man/3/fread> function and returns its return value.

Exceptions:

$ptr must be defined. Otherwise an exception is thrown.

$size must be more than or equal to 0. Otherwise an exception is thrown.

$nmemb must be more than or equal to 0. Otherwise an exception is thrown.

$stream must be defined. Otherwise an exception is thrown.

$nmemb * $size must be less than or equal to the length of $ptr - $ptr_offset. Otherwise an exception is thrown.

If the return value is less than $nmemb and C<ferror(stream)> is non-zero, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 feof

C<static method feof : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<feof|https://linux.die.net/man/3/feof> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

=head2 ferror

C<static method ferror : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<ferror|https://linux.die.net/man/3/ferror> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

=head2 clearerr

C<static method clearerr : void ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<clearerr|https://linux.die.net/man/3/clearerr> function.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

=head2 getc

C<static method getc : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<getc|https://linux.die.net/man/3/getc> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the return value is C<EOF> and C<ferror(stream)> is non-zero, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 ungetc

C<static method ungetc : int ($c : int, $stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<ungetc|https://linux.die.net/man/3/ungetc> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the return value is C<EOF> and C<ferror(stream)> is non-zero, an exception is thrown.

=head2 fgets

C<static method fgets : mutable string ($s : mutable string, $size : int, $stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $s_offset : int = 0);>

Calls the L<fgets|https://linux.die.net/man/3/fgets> function and returns its return value.

Exceptions:

$s must be defined. Otherwise an exception is thrown.

$size must be more than or equal to 0. Otherwise an exception is thrown.

$stream must be defined. Otherwise an exception is thrown.

$size must be less than the length of $s - $s_offset. Otherwise an exception is thrown.

=head2 fwrite

C<static method fwrite : int ($ptr : string, $size : int, $nmemb : int, $stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $ptr_offset : int = 0);>

Calls the L<fwrite|https://linux.die.net/man/3/fwrite> function and returns its return value.

Exceptions:

$ptr must be defined. Otherwise an exception is thrown.

$size must be more than or equal to 0. Otherwise an exception is thrown.

$nmemb must be more than or equal to 0. Otherwise an exception is thrown.

$stream must be defined. Otherwise an exception is thrown.

$nmemb * $size must be less than or equal to the length of $ptr - $ptr_offset. Otherwise an exception is thrown.

If the return value is less than $nmemb and C<ferror(stream)> is non-zero, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fclose

C<static method fclose : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<fclose|https://linux.die.net/man/3/fclose> function and returns its return value.

If successful, the L<closed|SPVM::Sys::IO::FileStream/"closed"> field is set to 1.

Exceptions:

$stream must be defined

If the fclose function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fseek

C<static method fseek : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $offset : long, $whence : int);>

Calls the L<fseek|https://linux.die.net/man/3/fseek> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to $whence.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

$offset must be greater than or equal to 0. Otherwise an exception is thrown.

If the fseek function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 ftell

C<static method ftell : long ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<ftell|https://linux.die.net/man/3/ftell> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the ftell function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fflush

C<static method fflush : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<fflush|https://linux.die.net/man/3/fflush> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the fflush function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 freopen

C<static method freopen : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ($path : string, $mode : string, $stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<freopen|https://linux.die.net/man/3/freopen> function and returns its return value.

Exceptions:

$path must be defined. Otherwise an exception is thrown.

$mode must be defined. Otherwise an exception is thrown.

$stream must be defined. Otherwise an exception is thrown.

If the freopen function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 setvbuf

C<static method setvbuf : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $buf : mutable string, $mode : int, $size : int);>

Calls the L<setvbuf|https://linux.die.net/man/3/setvbuf> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to $mode.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If $buf is defined, $size must be greater than or equal to 0. Otherwise an exception is thrown.

If $buf is defined, $size must be less than or equal to the length of $buf. Otherwise an exception is thrown.

If the setvbuf function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 setbuf

C<static method setbuf : void ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $buf : mutable string);>

Calls the L</"setvbuf"> method given the following mode $mode and size $size.

If $buf is defined, $mode is set to C<_IOFBF>, otherwise C<_IONBF>.

$size is C<BUFSIZ>.

=head2 setbuffer

C<static method setbuffer : void ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>, $buf : mutable string, $size : int);>

Calls the L</"setvbuf"> method given the following mode $mode.

If $buf is defined, $mode is set to C<_IOFBF>, otherwise C<_IONBF>.

=head2 setlinebuf

C<static method setlinebuf : void ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L</"setvbuf"> method given the following buffer $buf and mode $mode.

$buf is undef.

$mode is C<_IOLBF>.

$size is C<BUFSIZ>.

=head2 open

C<static method open : int ($path : string, $flags : int, $mode : int = 0);>

Calls the L<open|https://linux.die.net/man/2/open> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to the flags $flags and the mode $mode.

Exceptions:

$path must be defined. Otherwise an exception is thrown.

If the open function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 read

C<static method read : int ($fd : int, $buf : mutable string, $count : int, $buf_offset : int = 0);>

Calls the L<read|https://linux.die.net/man/2/read> function and returns its return value.

Exceptions:

$buf must be defined. Otherwise an exception is thrown.

$count must be more than or equal to 0. Otherwise an exception is thrown.

$count must be less than the length of $buf - $buf_offset. Otherwise an exception is thrown.

If the read function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 write

C<static method write : int ($fd : int, $buf : string, $count : int, $buf_offset : int = 0);>

Calls the L<write|https://linux.die.net/man/2/write> function and returns its return value.

Exceptions:

$buf must be defined. Otherwise an exception is thrown.

$buf_offse must be greater than or equal to 0. Otherwise an exception is thrown.

$count must be less than the length of $buf - $buf_offset. Otherwise an exception is thrown.

If the write function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 lseek

C<static method lseek : long ($fd : int, $offset : long, $whence : int);>

Calls the L<lseek|https://linux.die.net/man/2/lseek> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to $whence.

Exceptions:

$offset must be greater than or equal to 0. Otherwise an exception is thrown.

If the lseek function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 close

C<static method close : int ($fd : int);>

Calls the L<close|https://linux.die.net/man/2/close> function and returns its return value.

Exceptions:

If the close function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fsync

C<static method fsync : int ($fd : int);>

Calls the L<fsync|https://linux.die.net/man/2/fsync> function and returns its return value.

Exceptions:

If the fsync function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 fcntl

C<static method fcntl : int ($fd : int, $command : int, $command_arg : object of Int|Sys::IO::Flock = undef);>

Calls the L<fcntl|https://linux.die.net/man/2/fcntl> function and returns its return value.

Exceptions:

$command_arg must be an instance of the Int class or Sys::IO::Flock class.

=head2 ftruncate

C<static method ftruncate : int ($fd : int, $length : long);>

Calls the L<ftruncate|https://linux.die.net/man/2/ftruncate> function and returns its return value.

Exceptions:

If the ftruncate function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 flock

C<static method flock : int ($fd : int, $operation : int);>

Calls the L<flock|https://linux.die.net/man/2/flock> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to the operation $operation.

Exceptions:

If the flock function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 access

C<static method access : int ($pathname : string, $mode : int);>

Calls the L<access|https://linux.die.net/man/2/access> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to the mode $mode.

Exceptions:

$pathname must be defined. Otherwise an exception is thrown.

If the access function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 faccessat

  static method faccessat : int ($dirfd : int, $pathname : string, $mode : int, $flags : int);

Calls the L<faccessat|https://linux.die.net/man/2/faccessat> function and returns its return value.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to the mode $mode and the flag $flag.

Exceptions:

$pathname must be defined. Otherwise an exception is thrown.

If the faccessat function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 eaccess

C<static method eaccess : int ($pathname : string, $mode : int);>

Calls L</eaccess() checks whether the calling process can eaccess the file pathname. If pathname is a symbolic link, it is dereferenced.

Calls the L</"faccessat"> method given the following $dirfd and $flag.

$dirfd is C<AT_FDCWD>.

$flag is C<AT_EACCESS>.

=head2 truncate

C<static method truncate : int ($path : string, $length : long);>

Calls the L<truncate|https://linux.die.net/man/2/truncate> function and returns its return value.

Exceptions:

$path must be defined.

$length must be less than or equal to 0.

If the truncate function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 mkdir

C<static method mkdir : int ($path : string, $mode : int);>

Windows:

Calls the L<_mkdir|https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/mkdir-wmkdir?view=msvc-170> function and return its return value.

OS other than Windows:

Calls the L<mkdir|https://linux.die.net/man/2/mkdir> function and return its return value.

Exceptions:

If the mkdir(or _mkdir) function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 umask

C<static method umask : int ($mode : int);>

Calls the L<umask|https://linux.die.net/man/2/umask> function and return its return value.

=head2 rmdir

C<static method rmdir : int ($path : string);>

Calls the L<rmdir|https://linux.die.net/man/2/rmdir> function and return its return value.

Exceptions:

$path must be defined.

If the rmdir function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 unlink

C<static method unlink : int ($pathname : string);>

Calls the L<unlink|https://linux.die.net/man/2/unlink> function and return its return value.

Exceptions:

$pathname must be defined.

If the unlink function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 rename

C<static method rename : int ($oldpath : string, $newpath : string);>

Calls the L<rename|https://linux.die.net/man/2/rename> function and return its return value.

Exceptions:

$oldpath must be defined.

$newpath must be defined.

If the rename function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head2 getcwd

C<static method getcwd : mutable string ($buf : mutable string, $size : int);>

The getcwd() function copies an absolute pathname of the current working directory to the array pointed to by buf, which is of length size.

See the L<getcwd|https://linux.die.net/man/2/getcwd> function in Linux.

Exceptions:

=head2 _getdcwd

C<static method _getdcwd : mutable string ($drive : int, $buffer : mutable string, $maxlen : int);>

Gets the full path of the current working directory on the specified drive.

See the L<_getdcwd|https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getdcwd-wgetdcwd?view=msvc-170> function in the case of Windows.

Exceptions:

=head2 realpath

C<static method realpath : mutable string ($path : string, $resolved_path : mutable string);>

realpath() expands all symbolic links and resolves references to /./, /../ and extra '/' characters in the null-terminated string named by path to produce a canonicalized absolute pathname. The resulting pathname is stored as a null-terminated string, up to a maximum of PATH_MAX bytes, in the buf pointed to by resolved_path. The resulting path will have no symbolic link, /./ or /../ components.

See the L<realpath|https://linux.die.net/man/3/realpath> function in Linux.

Exceptions:

=head2 _fullpath

C<native static method _fullpath : mutable string ($absPath : mutable string, $relPath : string, $maxLength : int);>

Creates an absolute or full path name for the specified relative path name.

See the L<_fullpath|https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fullpath-wfullpath?view=msvc-170> function in the case of Windows.

Exceptions:

=head2 chdir

C<static method chdir : int ($path : string);>

chdir() changes the current working directory of the calling process to the directory specified in path.

See the L<chdir|https://linux.die.net/man/2/chdir> function in Linux.

Exceptions:

=head2 chmod

C<static method chmod : int ($path : string, $mode :int);>

chmod() changes the permissions of the file specified whose pathname is given in path, which is dereferenced if it is a symbolic link.

See the L<chmod|https://linux.die.net/man/2/chmod> function in Linux.

See L<Sys::IO::Constant|SPVM::Sys::IO::Constant> about constant values given to the mode.

Exceptions:

=head2 chown

C<static method chown : int ($path : string, $owner : int, $group : int);>

chown() changes the ownership of the file specified by path, which is dereferenced if it is a symbolic link.

See the L<chown|https://linux.die.net/man/2/chown> function in Linux.

Exceptions:

=head2 symlink

C<static method symlink : int ($oldpath : string, $newpath : string);>

symlink() creates a symbolic link named newpath which contains the string oldpath.

See the L<symlink|https://linux.die.net/man/2/symlink> function in Linux.

Exceptions:

=head2 readlink

C<static method readlink : int ($path : string, $buf : mutable string, $bufsiz : int);>

readlink() places the contents of the symbolic link path in the buf buf, which has size bufsiz. readlink() does not append a null byte to buf. It will truncate the contents (to a length of bufsiz characters), in case the buf is too small to hold all of the contents.

See the L<readlink|https://linux.die.net/man/2/readlink> function in Linux.

Exceptions:

=head2 get_readlink_buffer_size

C<native static method get_readlink_buffer_size : int ($path : string);>

Gets the L</"readlink"> needed buffer size.

Exceptions:

=head2 opendir

C<static method opendir : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> ($dir : string);>

The opendir() function opens a directory stream corresponding to the directory name, and returns a pointer to the directory stream. The stream is positioned at the first entry in the directory.

See the L<opendir|https://linux.die.net/man/3/opendir> function in Linux.

The return value is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

Exceptions:

=head2 closedir

C<static method closedir : int ($dirp : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>);>

The closedir() function closes the directory stream associated with dirp. A successful call to closedir() also closes the underlying file descriptor associated with dirp. The directory stream descriptor dirp is not available after this call.

See the L<closedir|https://linux.die.net/man/3/closedir> function in Linux.

The directory stream is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

Exceptions:

=head2 readdir

C<static method readdir : L<Sys::IO::Dirent|SPVM::Sys::IO::Dirent> ($dirp : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>); # Non-thead safe>

The readdir() function returns a pointer to a dirent structure representing the next directory entry in the directory stream pointed to by dirp. It returns NULL on reaching the end of the directory stream or if an error occurred.

See the L<readdir|https://linux.die.net/man/3/readdir> function in Linux.

The directory stream is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

The return value is a L<Sys::IO::Dirent|SPVM::Sys::IO::Dirent> object.

Exceptions:

=head2 rewinddir

C<static method rewinddir : void ($dirp : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>);>

The rewinddir() function resets the position of the directory stream dirp to the beginning of the directory.

See the L<rewinddir|https://linux.die.net/man/3/rewinddir> function in Linux.

The directory stream is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

Exceptions:

=head2 telldir

C<static method telldir : long ($dirp : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>);>

The telldir() function returns the current location associated with the directory stream dirp.

See the L<telldir|https://linux.die.net/man/3/telldir> function in Linux.

The directory stream is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

Exceptions:

=head2 seekdir

C<static method seekdir : void ($dirp : L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream>, $offset : long);>

The seekdir() function sets the location in the directory stream from which the next readdir(2) call will start. seekdir() should be used with an offset returned by telldir(3).
See the L<seekdir|https://linux.die.net/man/3/seekdir> function in Linux.

The directory stream is a L<Sys::IO::DirStream|SPVM::Sys::IO::DirStream> object.

Exceptions:

=head2 popen

C<static method popen : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ($command : string, $type : string);>

Calls the L<popen|https://linux.die.net/man/3/popen> function and returns its return value.

Exceptions:

$command must be defined. Otherwise an exception is thrown.

$type must be defined. Otherwise an exception is thrown.

If the popen function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

Exceptions:

=head2 _popen

C<static method _popen : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream> ($command : string, $type : string);>

Calls the L<_popen|https://learn.microsoft.com/ja-jp/cpp/c-runtime-library/reference/popen-wpopen?view=msvc-170> function and returns its return value.

Exceptions:

$command must be defined. Otherwise an exception is thrown.

$type must be defined. Otherwise an exception is thrown.

If the _popen function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

Exceptions:

=head2 pclose

C<static method pclose : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<pclose|https://linux.die.net/man/3/pclose> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the pclose function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

Exceptions:

=head2 _pclose

C<static method _pclose : int ($stream : L<Sys::IO::FileStream|SPVM::Sys::IO::FileStream>);>

Calls the L<_pclose|https://learn.microsoft.com/ja-jp/cpp/c-runtime-library/reference/pclose?view=msvc-170> function and returns its return value.

Exceptions:

$stream must be defined. Otherwise an exception is thrown.

If the _pclose function failed, an exception is thrown with C<eval_error_id> set to the basic type ID of the L<Error::System|SPVM::Error::System> class.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

