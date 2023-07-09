include "config.f90"

!------------------------------------------------------------------------------
!
program tester
  use iso_c_binding
  use libc
  use Msgpack_raw
  use Msgpack
  use config
  implicit none

  call print_sep("version.h")
  call test_version()
!  call print_sep("sbuffer.h")
!  call test_sbuffer()
!  call print_sep("example 1")
!  call test_example()
!  call print_sep("example with wrapper")
!  call test_example_with_wrapper()
  call print_sep ("dump example")
  call test_example_then_dump()
  call print_sep ("read dumped")
  call test_read()


contains
  !----------------------------------------------------------
  subroutine print_sep(title)
    character(*), intent(in) :: title
    print *, ""
    print *, "--------------------------------------------------"
    print *, "! Tests of " // title
  end subroutine print_sep

  subroutine check(r)
    integer, intent (in) :: r
    if (r /= 0) then
      error stop
    end if
  end subroutine

  !----------------------------------------------------------
  subroutine test_version()
    print *, "MessagePack runtime version: ", mp_version()
    print *, "Major version of runtime: ", msgpack_version_major()
    print *, "Minor version of runtime: ", msgpack_version_minor()
    print *, "Revision of runtime: ", msgpack_version_revision()
  end subroutine test_version

  !----------------------------------------------------------
  subroutine test_sbuffer()
    type(c_ptr) :: sbuf
    sbuf = msgpack_sbuffer_new()
    print *, "sbuffer allocation succeeded: ", c_associated(sbuf)
    call msgpack_sbuffer_free(sbuf)
  end subroutine test_sbuffer

  !----------------------------------------------------------
  ! https://github.com/msgpack/msgpack-c/tree/c_master
  subroutine test_example()
    type(c_ptr) :: sbuf, pk, mempool, deserialized
    integer (c_int) :: res
    logical (c_bool) :: succeeded

    ! allocation and initialization.
    sbuf = msgpack_sbuffer_new ()
    call msgpack_sbuffer_init (sbuf)

    ! serialize values.
    pk = msgpack_packer_new (sbuf, c_funloc (msgpack_sbuffer_write))

    res = msgpack_pack_array (pk, int8(3))
    res = msgpack_pack_int (pk, 1)
    res = msgpack_pack_true (pk)
    res = msgpack_pack_str (pk, int8(7))
    res = msgpack_pack_str_body (pk, "example", int8(7))

    ! deserialize
    mempool = msgpack_zone_new (int8 (2048))
    succeeded = msgpack_zone_init (mempool, int8 (2048))
    deserialized = mp_object_new()
    res = msgpack_unpack (mp_sbuffer_ptr (sbuf), mp_sbuffer_size (sbuf), &
      c_null_ptr, mempool, deserialized)

    ! print
    call mp_object_dump (deserialized)
    print *, ""

    call mp_object_free (deserialized)
    call msgpack_zone_free (mempool)

    call msgpack_packer_free (pk)
    call msgpack_sbuffer_free (sbuf)
  end subroutine test_example


  !----------------------------------------------------------
  ! with more wrapper
  subroutine test_example_with_wrapper()
    type(mp_packer) :: mpp
    type(c_ptr) :: mempool, deserialized
    integer (c_int) :: res
    logical (c_bool) :: succeeded
    integer :: r

    ! allocation and initialization.
    call mp_packer_initialize(mpp)

    call mp_pack_array (mpp, 3)
    call mp_pack_int (mpp, 1)
    call mp_pack_true (mpp)
    call mp_pack_str (mpp, "example")

    ! deserialize
    mempool = msgpack_zone_new (int8 (2048))
    succeeded = msgpack_zone_init (mempool, int8 (2048))
    deserialized = mp_object_new()
    res = msgpack_unpack (mp_packer_ptr (mpp), mp_packer_size (mpp), &
      c_null_ptr, mempool, deserialized)

    ! print
    call mp_object_dump (deserialized)
    print *, ""

    call mp_object_free (deserialized)
    call msgpack_zone_free (mempool)

    call mp_packer_destroy (mpp)
  end subroutine test_example_with_wrapper

  !----------------------------------------------------------
  ! with more wrapper then dump
  subroutine test_example_then_dump()
    type(mp_packer) :: mpp
    type(c_ptr) :: mempool, deserialized
    integer (c_int) :: res
    logical (c_bool) :: succeeded
    integer :: r

    ! allocation and initialization.
    call mp_packer_initialize(mpp)

    call mp_pack_array (mpp, 3)
    call mp_pack_int (mpp, 1)
    call mp_pack_true (mpp)
    call mp_pack_str (mpp, "example")

    call mp_packer_dump(mpp)

    call mp_packer_destroy (mpp)
  end subroutine test_example_then_dump

  !----------------------------------------------------------
  subroutine test_read()
    character(*), parameter :: file_path = test_data
    type (mp_unpacker) :: up

    call mp_unpacker_read_from_file (file_path, up)
    call mp_unpacker_dump(up)
    call mp_unpacker_destroy (up)

  end subroutine
end program tester
