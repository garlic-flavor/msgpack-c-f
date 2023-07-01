
!------------------------------------------------------------------------------
! interfaces of libc
module libc
  use iso_c_binding
  implicit none

  integer(c_int), bind(c, name='STDOUT_FILENO') :: c_stdout_fd
  integer(c_int), bind(c, name='STDIN_FILENO') :: c_stdin_fd
  integer(c_int), bind(c, name='STDERR_FILENO') :: c_stderr_fd

  interface
    !----------------------------------------------------------
    function strlen(p) bind (c)
      import c_ptr, c_size_t
      type(c_ptr), value :: p
      integer(c_size_t) strlen
    end function
    !----------------------------------------------------------
    function memset (b, c, len) bind (c)
      import c_ptr, c_int, c_size_t
      type(c_ptr) :: memset
      type(c_ptr), value :: b
      integer(c_int), value :: c
      integer(c_size_t), value :: len
    end function
    !----------------------------------------------------------
    function fileno (stream) bind (c)
      import c_int, c_ptr
      integer (c_int) :: fileno
      type(c_ptr), value :: stream
    end function
    !----------------------------------------------------------
    function dup(fildes) bind (C)
      import c_int
      integer (c_int) :: dup
      integer (c_int), value :: fildes
    end function
    !----------------------------------------------------------
    function fopen (path, mode) bind (c)
      import c_ptr, c_char
      type (c_ptr) :: fopen
      character (kind=c_char) :: path(*)
      character (kind=c_char) :: mode(*)
    end function
    !----------------------------------------------------------
    function freopen (path, mode, stream) bind (c)
      import c_ptr, c_char
      type (c_ptr) :: freopen
      character (kind=c_char) :: path(*)
      character (kind=c_char) :: mode(*)
      type (c_ptr), value :: stream
    end function
    !----------------------------------------------------------
    function fdopen (fildes, mode) bind (c)
      import c_ptr, c_int, c_char
      type (c_ptr) :: fdopen
      integer (c_int), value :: fildes
      character (kind=c_char) :: mode(*)
    end function
    !----------------------------------------------------------
    function fclose (stream) bind (c)
      import c_int, c_ptr
      integer (c_int) :: fclose
      type (c_ptr), value :: stream
    end function
    !----------------------------------------------------------
    function fread (ptr, s, nitems, stream) bind (c)
      import c_size_t, c_ptr
      integer (c_size_t) :: fread
      type (c_ptr), value :: ptr
      integer (c_size_t), value :: s
      integer (c_size_t), value :: nitems
      type (c_ptr), value :: stream
    end function
    !----------------------------------------------------------
    function fwrite (ptr, s, nitems, stream) bind (c)
      import c_size_t, c_ptr
      integer (c_size_t) :: fread
      type (c_ptr), value :: ptr
      integer (c_size_t), value :: s
      integer (c_size_t), value :: nitems
      type (c_ptr), value :: stream
    end function

  end interface
contains
  !--------------------------------------------------------------------
  function fstring (ccp)
    type(c_ptr), intent(in) :: ccp
    character(:, c_char), pointer :: fstring
    fstring => convert_cptr(ccp, strlen(ccp))
  end function
  !--------------------------------------------------------------------
  function convert_cptr(p, len)
    type(c_ptr), intent(in) :: p
    integer(c_size_t), intent(in) :: len
    character(len, c_char), pointer :: convert_cptr

    call c_f_pointer(p, convert_cptr)
  end function
  !--------------------------------------------------------------------
  pure function cstring (string)
    character(*, c_char), intent(in) :: string
    character(:, c_char), allocatable :: cstring
    cstring = string//c_null_char
  end function
end module libc
