! This is a wrapper of MessagePack with msgpack-c
!
! [MessagePack](https://msgpack.org)
! [msgpack-c](https://github.com/msgpack/msgpack-c/tree/c_master)
!


!------------------------------------------------------------------------------
! Raw interfaces of msgpack-c
module Msgpack_raw
  use iso_c_binding
  implicit none

  !--------------------------------------------------------------------
  enum, bind (c)
    enumerator :: MSGPACK_OBJECT_NIL                  = int(z'00')
    enumerator :: MSGPACK_OBJECT_BOOLEAN              = int(z'01')
    enumerator :: MSGPACK_OBJECT_POSITIVE_INTEGER     = int(z'02')
    enumerator :: MSGPACK_OBJECT_NEGATIVE_INTEGER     = int(z'03')
    enumerator :: MSGPACK_OBJECT_FLOAT32              = int(z'0a')
    enumerator :: MSGPACK_OBJECT_FLOAT64              = int(z'04')
    enumerator :: MSGPACK_OBJECT_FLOAT                = int(z'04')
    enumerator :: MSGPACK_OBJECT_STR                  = int(z'05')
    enumerator :: MSGPACK_OBJECT_ARRAY                = int(z'06')
    enumerator :: MSGPACK_OBJECT_MAP                  = int(z'07')
    enumerator :: MSGPACK_OBJECT_BIN                  = int(z'08')
    enumerator :: MSGPACK_OBJECT_EXT                  = int(z'09')
  end enum 
  !--------------------------------------------------------------------
  enum, bind (c)
    enumerator :: MSGPACK_UNPACK_SUCCESS              =  2
    enumerator :: MSGPACK_UNPACK_EXTRA_BYTES          =  1
    enumerator :: MSGPACK_UNPACK_CONTINUE             =  0
    enumerator :: MSGPACK_UNPACK_PARSE_ERROR          = -1
    enumerator :: MSGPACK_UNPACK_NOMEM_ERROR          = -2
  end enum

  !====================================================================
  interface
    !==========================================================
    ! version.h
    !----------------------------------------------------------
    function msgpack_version() bind (c)
      import c_ptr
      type(c_ptr) :: msgpack_version
    end function
    !----------------------------------------------------------
    function msgpack_version_major() bind (c)
      import c_int
      integer(c_int) :: msgpack_version_major
    end function
    !----------------------------------------------------------
    function msgpack_version_minor() bind (c)
      import c_int
      integer(c_int) :: msgpack_version_minor
    end function
    !----------------------------------------------------------
    function msgpack_version_revision() bind (c)
      import c_int
      integer(c_int) :: msgpack_version_revision
    end function

    !==========================================================
    ! sbuffer.h
    !----------------------------------------------------------
    subroutine msgpack_sbuffer_init(sbuf) &
        bind (c, name='msgpack_sbuffer_init_wrapped')
      import c_ptr
      type(c_ptr), value :: sbuf
    end subroutine
    !----------------------------------------------------------
    subroutine msgpack_sbuffer_destroy(sbuf) &
        bind (c, name='msgpack_sbuffer_destroy_wrapped')
      import c_ptr
      type(c_ptr), value :: sbuf
    end subroutine
    !----------------------------------------------------------
    function msgpack_sbuffer_new() &
        bind (c, name='msgpack_sbuffer_new_wrapped')
      import c_ptr
      type(c_ptr) :: msgpack_sbuffer_new
    end function
    !----------------------------------------------------------
    subroutine msgpack_sbuffer_free(sbuf) &
        bind (c, name='msgpack_sbuffer_free_wrapped')
      import c_ptr
      type(c_ptr), value :: sbuf
    end subroutine
    !----------------------------------------------------------
    function msgpack_sbuffer_write(d, buf, len) &
        bind (c, name='msgpack_sbuffer_write_wrapped')
      import c_ptr, c_size_t, c_int
      type(c_ptr), value :: d
      type(c_ptr), value :: buf
      integer(c_size_t), value :: len
      integer(c_int) :: msgpack_sbuffer_write
    end function
    !----------------------------------------------------------
    function msgpack_sbuffer_release (sbuf) &
        bind (c, name='msgpack_sbuffer_release_wrapped')
      import c_ptr
      type(c_ptr), value :: sbuf
      type(c_ptr) :: msgpack_sbuffer_release
    end function
    !----------------------------------------------------------
    subroutine msgpack_sbuffer_clear (sbuf) &
        bind (c, name='msgpack_sbuffer_clear_wrapped')
      import c_ptr
      type(c_ptr), value :: sbuf
    end subroutine

    !==========================================================
    ! pack.h
    !----------------------------------------------------------
    function msgpack_pack_char(pk, d) &
        bind (c, name='sgpack_pack_char_wrapped')
      import c_int, c_ptr, c_char
      integer(c_int) :: msgpack_pack_char
      type(c_ptr), value :: pk
      character(c_char), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_signed_char(pk, d) &
        bind (c, name='msgpack_pack_signed_char_wrapped')
      import c_int, c_ptr, c_char
      integer(c_int) :: msgpack_pack_signed_char
      type(c_ptr), value :: pk
      character(c_char), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_short(pk, d) &
        bind (c, name='msgpack_pack_short_wrapped')
      import c_int, c_ptr, c_short
      integer(c_int) :: msgpack_pack_short
      type(c_ptr), value :: pk
      integer(c_short), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_int(pk, d) &
        bind (c, name='msgpack_pack_int_wrapped')
      import c_ptr, c_int
      integer(c_int) msgpack_pack_int
      type(c_ptr), value :: pk
      integer(c_int), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_long(pk, d) &
        bind (c, name='msgpack_pack_long_wrapped')
      import c_ptr, c_int, c_long
      integer(c_int) msgpack_pack_long
      type(c_ptr), value :: pk
      integer(c_long), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_long_long(pk, d) &
        bind (c, name='msgpack_pack_long_long_wrapped')
      import c_ptr, c_int, c_long_long
      integer(c_int) msgpack_pack_long_long
      type(c_ptr), value :: pk
      integer(c_long_long), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_unsigned_char(pk, d) &
        bind (c, name='msgpack_pack_unsigned_char_wrapped')
      import c_ptr, c_int, c_char
      integer(c_int) :: msgpack_pack_unsigned_char
      type(c_ptr), value :: pk
      character(c_char), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_unsigned_short(pk, d) &
        bind (c, name='msgpack_pack_unsigned_short_wrapped')
      import c_ptr, c_int, c_short
      integer(c_int) :: msgpack_pack_unsigned_short
      type(c_ptr), value ::pk
      integer(c_short), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_unsigned_int(pk, d) &
        bind (c, name='msgpack_pack_unsigned_int_wrapped')
      import c_ptr, c_int
      integer(c_int) :: msgpack_pack_unsigned_int
      type(c_ptr), value :: pk
      integer(c_int), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_unsigned_long(pk, d) &
        bind (c, name='msgpack_pack_unsigned_long_wrapped')
      import c_ptr, c_int, c_long
      integer(c_int) :: msgpack_pack_unsigned_long
      type(c_ptr), value :: pk
      integer(c_long), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_unsigned_long_long(pk, d) &
        bind (c, name='msgpack_pack_unsigned_long_long_wrapped')
      import c_ptr, c_int, c_long_long
      integer(c_int) :: msgpack_pack_unsigned_long_long
      type(c_ptr), value :: pk
      integer(c_long_long), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_uint8(pk, d) &
        bind (c, name='msgpack_pack_uint8_wrapped')
      import c_ptr, c_int, c_int8_t
      integer(c_int) :: msgpack_pack_uint8
      type(c_ptr), value :: pk
      integer(c_int8_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_uint16(pk, d) &
        bind (c, name='msgpack_pack_uint16_wrapped')
      import c_ptr, c_int, c_int16_t
      integer(c_int) :: msgpack_pack_uint16
      type(c_ptr), value :: pk
      integer(c_int16_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_uint32(pk, d) &
        bind (c, name='msgpack_pack_uint32_wrapped')
      import c_ptr, c_int, c_int32_t
      integer(c_int) :: msgpack_pack_uint32
      type(c_ptr), value :: pk
      integer(c_int32_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_uint64(pk, d) &
        bind (c, name='msgpack_pack_uint64_wrapped')
      import c_ptr, c_int, c_int64_t
      integer(c_int) :: msgpack_pack_uint64
      type(c_ptr), value :: pk
      integer(c_int64_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_int8(pk, d) &
        bind (c, name='msgpack_pack_int8_wrapped')
      import c_ptr, c_int, c_int8_t
      integer(c_int) msgpack_pack_int8
      type(c_ptr), value :: pk
      integer(c_int8_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_int16(pk, d) &
        bind (c, name='msgpack_pack_int16_wrapped')
      import c_ptr, c_int, c_int16_t
      integer(c_int) msgpack_pack_int16
      type(c_ptr), value :: pk
      integer(c_int16_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_int32(pk, d) &
        bind (c, name='msgpack_pack_int32_wrapped')
      import c_ptr, c_int, c_int32_t
      integer(c_int) :: msgpack_pack_int32
      type(c_ptr), value :: pk
      integer(c_int32_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_int64(pk, d) &
        bind (c, name='msgpack_pack_int64_wrapped')
      import c_ptr, c_int, c_int64_t
      integer(c_int) msgpack_pack_int64
      type(c_ptr), value :: pk
      integer(c_int64_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_uint8(pk, d) &
        bind (c, name='msgpack_pack_fix_uint8_wrapped')
      import c_ptr, c_int, c_int8_t
      integer(c_int) :: msgpack_pack_fix_uint8
      type(c_ptr), value :: pk
      integer(c_int8_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_uint16(pk, d) &
        bind (c, name='msgpack_pack_fix_uint16_wrapped')
      import c_ptr, c_int, c_int16_t
      integer(c_int) :: msgpack_pack_fix_uint16
      type(c_ptr), value :: pk
      integer(c_int16_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_uint32(pk, d) &
        bind (c, name='msgpack_pack_fix_uint32_wrapped')
      import c_ptr, c_int, c_int32_t
      integer(c_int) :: msgpack_pack_fix_uint32
      type(c_ptr), value :: pk
      integer(c_int32_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_uint64(pk, d) &
        bind (c, name='msgpack_pack_fix_uint64_wrapped')
      import c_ptr, c_int, c_int64_t
      integer(c_int) :: msgpack_pack_fix_uint64
      type(c_ptr), value :: pk
      integer(c_int64_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_int8(pk, d) &
        bind (c, name='msgpack_pack_fix_int8_wrapped')
      import c_ptr, c_int, c_int8_t
      integer(c_int) :: msgpack_pack_fix_int8
      type(c_ptr), value :: pk
      integer(c_int8_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_int16(pk, d) &
        bind (c, name='msgpack_pack_fix_int16_wrapped')
      import c_ptr, c_int, c_int16_t
      integer(c_int) msgpack_pack_fix_int16
      type(c_ptr), value :: pk
      integer(c_int16_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_int32(pk, d) &
        bind (c, name='msgpack_pack_fix_int32_wrapped')
      import c_ptr, c_int, c_int32_t
      integer(c_int) :: msgpack_pack_fix_int32
      type(c_ptr), value :: pk
      integer(c_int32_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_fix_int64(pk, d) &
        bind (c, name='msgpack_pack_fix_int64_wrapped')
      import c_ptr, c_int, c_int64_t
      integer(c_int) :: msgpack_pack_fix_int64
      type(c_ptr), value :: pk
      integer(c_int64_t), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_float(pk, d) &
        bind (c, name='msgpack_pack_float_wrapped')
      import c_ptr, c_int, c_float
      integer(c_int) :: msgpack_pack_float
      type(c_ptr), value :: pk
      real(c_float), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_double(pk, d) &
        bind (c, name='msgpack_pack_double_wrapped')
      import c_ptr, c_int, c_double
      integer(c_int) :: msgpack_pack_double
      type(c_ptr), value :: pk
      real(c_double), value :: d
    end function
    !----------------------------------------------------------
    function msgpack_pack_nil(pk) &
        bind (c, name='msgpack_pack_nil_wrapped')
      import c_ptr, c_int
      integer(c_int) :: msgpack_pack_nil
      type(c_ptr), value :: pk
    end function
    !----------------------------------------------------------
    function msgpack_pack_true(pk) &
        bind (c, name='msgpack_pack_true_wrapped')
      import c_ptr, c_int
      integer(c_int) :: msgpack_pack_true
      type(c_ptr), value :: pk
    end function
    !----------------------------------------------------------
    function msgpack_pack_false(pk) &
        bind (c, name='msgpack_pack_false_wrapped')
      import c_ptr, c_int
      integer(c_int) :: msgpack_pack_false
      type(c_ptr), value :: pk
    end function
    !----------------------------------------------------------
    function msgpack_pack_array(pk, n) &
        bind (c, name='msgpack_pack_array_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_array
      type(c_ptr), value :: pk
      integer(c_size_t), value :: n
    end function
    !----------------------------------------------------------
    function msgpack_pack_map(pk, n) &
        bind (c, name='msgpack_pack_map_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_map
      type(c_ptr), value :: pk
      integer(c_size_t), value :: n
    end function
    !----------------------------------------------------------
    function msgpack_pack_str(pk, l) &
        bind(c, name='msgpack_pack_str_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_str
      type(c_ptr), value :: pk
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_str_body(pk, b, l) &
        bind (c, name='msgpack_pack_str_body_wrapped')
      import c_ptr, c_int, c_size_t, c_char
      integer(c_int) :: msgpack_pack_str_body
      type(c_ptr), value :: pk
      character(kind=c_char) :: b(*)
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_v4raw(pk, l) &
        bind (c, name='msgpack_pack_v4raw_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_v4raw
      type(c_ptr), value :: pk
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_v4raw_body(pk, b, l) &
        bind (c, name='msgpack_pack_v4raw_body_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_v4raw_body
      type(c_ptr), value :: pk
      type(c_ptr), value :: b
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_bin(pk, l) &
        bind (c, name='msgpack_pack_bin_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) msgpack_pack_bin
      type(c_ptr), value :: pk
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_bin_body(pk, b, l) &
        bind (c, name='msgpack_pack_bin_body_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_bin_body
      type(c_ptr), value :: pk
      type(c_ptr), value :: b
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_ext(pk, l, t) &
        bind (c, name='msgpack_pack_ext_wrapped')
      import c_ptr, c_int, c_size_t, c_int8_t
      integer(c_int) :: msgpack_pack_ext
      type(c_ptr), value :: pk
      integer(c_size_t), value :: l
      integer(c_int8_t), value :: t
    end function
    !----------------------------------------------------------
    function msgpack_pack_ext_body(pk, b, l) &
        bind (c, name='msgpack_pack_ext_body_wrapped')
      import c_ptr, c_int, c_size_t
      integer(c_int) :: msgpack_pack_ext_body
      type(c_ptr), value :: pk
      type(c_ptr), value :: b
      integer(c_size_t), value :: l
    end function
    !----------------------------------------------------------
    function msgpack_pack_object(pk, d) &
        bind (c, name='msgpack_pack_object_wrapped')
      import c_ptr, c_int
      integer(c_int) msgpack_pack_object
      type(c_ptr), value :: pk
      type(c_ptr), value :: d
    end function
 
    !----------------------------------------------------------
    subroutine msgpack_packer_init(pk, d, callback) &
        bind (c, name='msgpack_packer_init_wrapped')
      import c_ptr, c_funptr
      type(c_ptr), value :: pk
      type(c_ptr), value :: d
      type(c_funptr), value :: callback
    end subroutine
    !----------------------------------------------------------
    function msgpack_packer_new(d, callback) &
        bind (c, name='msgpack_packer_new_wrapped')
      import c_ptr, c_funptr
      type(c_ptr) :: msgpack_packer_new
      type(c_ptr), value :: d
      type(c_funptr), value :: callback
    end function
    !----------------------------------------------------------
    subroutine msgpack_packer_free(pk) &
        bind (c, name='msgpack_packer_free_wrapped')
      import c_ptr
      type(c_ptr), value :: pk
    end subroutine

    !==========================================================
    ! unpack.h
    !----------------------------------------------------------
    function msgpack_unpack_next(res, d, len, off) bind (c)
      import c_ptr, c_size_t, c_int
      integer(c_int) :: msgpack_unpack_next
      type(c_ptr), value :: res
      type(c_ptr), value :: d
      integer(c_size_t), value :: len
      type(c_ptr), value :: off
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_init(mpac, initial_buffer_size) bind (c)
      import c_ptr, c_size_t, c_bool
      logical(c_bool) :: msgpack_unpacker_init
      type(c_ptr), value :: mpac
      integer(c_size_t) initial_buffer_size
    end function
    !----------------------------------------------------------
    subroutine msgpack_unpacker_destroy(mpac) bind (c)
      import c_ptr
      type(c_ptr), value :: mpac
    end subroutine
    !----------------------------------------------------------
    function msgpack_unpacker_new(initial_buffer_size) bind (c)
      import c_ptr, c_size_t
      type(c_ptr) :: msgpack_unpacker_new
      integer(c_size_t), value :: initial_buffer_size
    end function
    !----------------------------------------------------------
    subroutine msgpack_unpacker_free(mpac) bind (c)
      import c_ptr
      type(c_ptr), value :: mpac
    end subroutine
 
    !----------------------------------------------------------
    function msgpack_unpacker_reserve_buffer(mpac, size) &
        bind (c, name='msgpack_unpacker_reserve_buffer_wrapped')
      import c_bool, c_ptr, c_size_t
      logical(c_bool) :: msgpack_unpacker_reserve_buffer
      type(c_ptr), value :: mpac
      integer(c_size_t), value :: size
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_buffer(mpac) &
        bind (c, name='msgpack_unpacker_buffer')
      import c_ptr
      type(c_ptr) :: msgpack_unpacker_buffer
      type(c_ptr), value :: mpac
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_buffer_capacity(mpac) &
        bind (c, name='msgpack_unpacker_buffer_capacity_wrapper')
      import c_ptr, c_size_t
      integer(c_size_t) :: msgpack_unpacker_buffer_capacity
      type(c_ptr), value :: mpac
    end function
 
    !----------------------------------------------------------
    subroutine msgpack_unpacker_buffer_consumed(mpac, s) &
        bind (c, name='msgpack_unpacker_buffer_consumed_wrapped')
      import c_ptr, c_size_t
      type(c_ptr), value :: mpac
      integer(c_size_t), value :: s
    end subroutine
    !----------------------------------------------------------
    function msgpack_unpacker_next(mpac, pac) bind (c)
      import c_ptr, c_int
      integer(c_int) :: msgpack_unpacker_next
      type(c_ptr), value :: mpac
      type(c_ptr), value :: pac
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_next_with_size(mpac, r, p_bytes) bind (c)
      import c_int, c_ptr
      integer(c_int) :: msgpack_unpacker_next_with_size
      type(c_ptr), value :: mpac
      type(c_ptr), value :: r
      type(c_ptr), value :: p_bytes
    end function
    !----------------------------------------------------------
    subroutine msgpack_unpacked_init(res) &
        bind(c, name='msgpack_unpacked_init_wrapped')
      import c_ptr
      type(c_ptr), value :: res
    end subroutine
    !----------------------------------------------------------
    subroutine msgpack_unpacked_destroy(res) &
        bind(c, name='msgpack_unpacked_destroy_wrapped')
      import c_ptr
      type(c_ptr), value :: res
    end subroutine
    !----------------------------------------------------------
    function msgpack_unpacked_release_zone(res) &
        bind (c, name='msgpack_unpacked_release_zone_wrapped')
      import c_ptr
      type(c_ptr) :: msgpack_unpacked_release_zone
      type(c_ptr), value :: res
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_execute(mpac) bind (c)
      import c_int, c_ptr
      integer(c_int) :: msgpack_unpacker_execute
      type(c_ptr), value :: mpac
    end function
 
    !----------------------------------------------------------
    function msgpack_unpacker_data (mpac) &
        bind (c, name='msgpack_unpacker_data_wrapped')
      import c_ptr
      type(c_ptr) :: msgpack_unpacker_data
      type(c_ptr), value :: mpac
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_release_zone(mpac) bind (c)
      import c_ptr
      type(c_ptr) :: msgpack_unpacker_release_zone
      type(c_ptr), value :: mpac
    end function
    !----------------------------------------------------------
    subroutine msgpack_unpacker_reset_zone(mpac) bind (c)
      import c_ptr
      type(c_ptr), value :: mpac
    end subroutine
    !----------------------------------------------------------
    subroutine msgpack_unpacker_reset(mpac) bind (c)
      import c_ptr
      type(c_ptr), value :: mpac
    end subroutine
    !----------------------------------------------------------
    function msgpack_unpacker_message_size(mpac) &
        bind (c, name='msgpack_unpacker_message_size_wrapped')
      import c_ptr, c_size_t
      integer(c_size_t) :: msgpack_unpacker_message_size
      type(c_ptr), value :: mpac
    end function
 
    !----------------------------------------------------------
    function msgpack_unpacker_parsed_size(mpac) &
        bind (c, name='msgpack_unpacker_parsed_size_wrapped')
      import c_ptr, c_size_t
      integer(c_size_t) :: msgpack_unpacker_parsed_size
      type(c_ptr), value :: mpac
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_flush_zone(mpac) bind (c)
      import c_ptr, c_bool
      logical(c_bool) :: msgpack_unpacker_flush_zone
      type(c_ptr), value :: mpac
    end function
    !----------------------------------------------------------
    function msgpack_unpacker_expand_buffer(mpac, s) bind (c)
      import c_bool, c_ptr, c_size_t
      logical(c_bool) :: msgpack_unpacker_expand_buffer
      type(c_ptr), value :: mpac
      integer(c_size_t), value :: s
    end function

    !----------------------------------------------------------
    ! obsolete
    function msgpack_unpack(data, len, off, result_zone, res) bind (c)
      import c_int, c_size_t, c_ptr
      integer (c_int) :: msgpack_unpack
      type (c_ptr), value :: data
      integer (c_size_t), value :: len
      type (c_ptr), value :: off
      type (c_ptr), value :: result_zone
      type (c_ptr), value :: res
    end function
 
    !----------------------------------------------------------
    function msgpack_unpacked_new() bind (c)
      import c_ptr
      type (c_ptr) :: msgpack_unpacked_new
    end function
    !----------------------------------------------------------
    subroutine msgpack_unpacked_free(up) bind (c)
      import c_ptr
      type (c_ptr), value :: up
    end subroutine
    !----------------------------------------------------------
    function msgpack_unpacked_object(up) bind (c)
      import c_ptr
      type (c_ptr) :: msgpack_unpacked_object
      type (c_ptr), value :: up
    end function
 
    !==========================================================
    ! zone.h
    !----------------------------------------------------------
    function msgpack_zone_init (zone, chunk_size) bind (c)
      import c_bool, c_ptr, c_size_t
      logical(c_bool) :: msgpack_zone_init
      type(c_ptr), value :: zone
      integer(c_size_t), value :: chunk_size
    end function
    !----------------------------------------------------------
    subroutine  msgpack_zone_destroy(zone) bind (c)
      import c_ptr
      type(c_ptr), value :: zone
    end subroutine
    !----------------------------------------------------------
    function msgpack_zone_new(chunk_size) bind (c)
      import c_ptr, c_size_t
      type(c_ptr) :: msgpack_zone_new
      integer(c_size_t), value :: chunk_size
    end function
    !----------------------------------------------------------
    subroutine msgpack_zone_free(zone) bind (c)
      import c_ptr
      type(c_ptr), value :: zone
    end subroutine
    !----------------------------------------------------------
    function msgpack_zone_malloc(zone,s) &
        bind (c, name='msgpack_zone_malloc_wrapped')
      import c_ptr, c_size_t
      type(c_ptr) :: msgpack_zone_malloc
      type(c_ptr), value :: zone
      integer(c_size_t), value :: s
    end function
    !----------------------------------------------------------
    function msgpack_zone_malloc_no_align(zone, s) &
        bind (c, name='msgpack_zone_malloc_no_align_wrapped')
      import c_ptr, c_size_t
      type(c_ptr) :: msgpack_zone_malloc_no_align
      type(c_ptr), value :: zone
      integer(c_size_t), value ::  s
    end function
    !----------------------------------------------------------
    function msgpack_zone_push_finalizer(zone, d, da) &
        bind (c, name='msgpack_zone_push_finalizer_wrapped')
      import c_bool, c_ptr, c_funptr
      logical(c_bool) :: msgpack_zone_push_finalizer
      type(c_ptr), value :: zone
      type(c_funptr), value :: d
      type(c_ptr), value :: da
    end function
    !----------------------------------------------------------
    subroutine msgpack_zone_swap(a, b) &
        bind (c, name='msgpack_zone_swap_wrapped')
      import c_ptr
      type(c_ptr), value :: a
      type(c_ptr), value :: b
    end subroutine
    !----------------------------------------------------------
    function msgpack_zone_is_empty(zone) bind (c)
      import c_bool, c_ptr
      logical(c_bool) :: msgpack_zone_is_empty
      type(c_ptr), value :: zone
    end function
    !----------------------------------------------------------
    subroutine msgpack_zone_clear(zone) bind (c)
      import c_ptr
      type(c_ptr), value :: zone
    end subroutine
    !----------------------------------------------------------
    function msgpack_zone_malloc_expand(zone, s) bind (c)
      import c_ptr, c_size_t
      type(c_ptr) msgpack_zone_malloc_expand
      type(c_ptr), value :: zone
      integer(c_size_t), value ::  s
    end function
    !----------------------------------------------------------
    function msgpack_zone_push_finalizer_expand(zone, d, da) bind(c)
      import c_bool, c_ptr, c_funptr
      logical(c_bool) :: msgpack_zone_push_finalizer_expand
      type(c_ptr), value :: zone
      type(c_funptr), value :: d
      type(c_ptr), value :: da
    end function
    !==========================================================
    ! vrefbuffer.h
    !----------------------------------------------------------
    function msgpack_vrefbuffer_init(vbuf, ref_size, chunk_size) bind(c)
      import c_bool, c_ptr, c_size_t
      logical(c_bool) :: msgpack_vrefbuffer_init
      type(c_ptr), value :: vbuf
      integer(c_size_t), value :: ref_size
      integer(c_size_t), value ::  chunk_size
    end function
    !----------------------------------------------------------
    subroutine msgpack_vrefbuffer_destroy(vbuf) bind (c)
      import c_ptr
      type(c_ptr), value :: vbuf
    end subroutine
    !----------------------------------------------------------
    function msgpack_vrefbuffer_new(ref_size, chunk_size) &
        bind (c, name='msgpack_vrefbuffer_new_wrapped')
      import c_ptr, c_size_t
      type(c_ptr) :: msgpack_vrefbuffer_new
      integer(c_size_t), value :: ref_size
      integer(c_size_t), value :: chunk_size
    end function
    !----------------------------------------------------------
    subroutine msgpack_vrefbuffer_free(vbuf) &
        bind (c, name='msgpack_vrefbuffer_free')
      import c_ptr
      type(c_ptr), value :: vbuf
    end subroutine
    !----------------------------------------------------------
    function msgpack_vrefbuffer_write(d, buf, len) &
        bind (c, name='msgpack_vrefbuffer_write_wrapped')
      import c_int, c_ptr, c_size_t
      integer(c_int) :: msgpack_vrefbuffer_write
      type(c_ptr), value :: d
      type(c_ptr), value :: buf
      integer(c_size_t), value :: len
    end function
    !----------------------------------------------------------
    function msgpack_vrefbuffer_vec(vref) &
        bind (c, name='msgpack_vrefbuffer_vec_wrapped')
      import c_ptr
      type(c_ptr) :: msgpack_vrefbuffer_vec
      type(c_ptr), value :: vref
    end function
    !----------------------------------------------------------
    function msgpack_vrefbuffer_veclen(vref) &
        bind (c, name='msgpack_vrefbuffer_veclen_wrapped')
      import c_size_t, c_ptr
      integer(c_size_t) :: msgpack_vrefbuffer_veclen
      type(c_ptr), value :: vref
    end function
    !----------------------------------------------------------
    function msgpack_vrefbuffer_append_copy(vbuf, buf, len) bind (c)
      import c_int, c_ptr, c_size_t
      integer(c_int) :: msgpack_vrefbuffer_append_copy
      type(c_ptr), value :: vbuf
      type(c_ptr), value :: buf
      integer(c_size_t), value :: len
    end function
    !----------------------------------------------------------
    function msgpack_vrefbuffer_append_ref(vbuf, buf, len) bind (c)
      import c_int, c_ptr, c_size_t
      integer(c_int) :: msgpack_vrefbuffer_append_ref
      type(c_ptr), value :: vbuf
      type(c_ptr), value :: buf
      integer(c_size_t), value :: len
    end function
    !----------------------------------------------------------
    function msgpack_vrefbuffer_migrate(vbuf, to) bind (c)
      import c_int, c_ptr
      integer(c_int) :: msgpack_vrefbuffer_migrate
      type(c_ptr), value :: vbuf
      type(c_ptr), value :: to
    end function
    !----------------------------------------------------------
    subroutine msgpack_vrefbuffer_clear(vref) bind (c)
      import c_ptr
      type(c_ptr), value :: vref
    end subroutine
 

    !==========================================================
    ! object.h
!    !----------------------------------------------------------
!    subroutine
! void msgpack_object_print(FILE* out, msgpack_object o);
!      import c_ptr
! void msgpack_object_print(FILE* out, msgpack_object o);
!    end subroutine
! 
!    !----------------------------------------------------------
! int msgpack_object_print_buffer(char *buffer, size_t buffer_size, msgpack_object o);
! int msgpack_object_print_buffer(char *buffer, size_t buffer_size, msgpack_object o);
! 
!    !----------------------------------------------------------
! bool msgpack_object_equal(const msgpack_object x, const msgpack_object y);
! bool msgpack_object_equal(const msgpack_object x, const msgpack_object y);
! 
  end interface
end module

!==============================================================================
! 
module Msgpack
  use iso_c_binding
  use libc
  use Msgpack_raw
  implicit none

  !--------------------------------------------------------------------
  type mp_packer
    type(c_ptr) :: sbuf
    type(c_ptr) :: pk
  end type mp_packer

  !--------------------------------------------------------------------
  type mp_unpacker
    character(:), allocatable :: src
    type (c_ptr) :: up
    integer (c_size_t) :: offset
  end type mp_unpacker

  interface
    !----------------------------------------------------------
    ! Definitions of these funcs/subs are in msgpack_wrapper.c
    !----------------------------------------------------------
    function mp_object_new () bind (c)
      import c_ptr
      type(c_ptr) mp_object_new
    end function
    !----------------------------------------------------------
    subroutine mp_object_destroy (pmo) bind (c)
      import c_ptr
      type(c_ptr), value :: pmo
    end subroutine
    !----------------------------------------------------------
    subroutine mp_object_free (pmo) bind (c)
      import c_ptr
      type(c_ptr), value :: pmo
    end subroutine

    !----------------------------------------------------------
    function mp_sbuffer_ptr (sbuf) bind (c)
      import c_ptr
      type (c_ptr) :: mp_sbuffer_ptr
      type (c_ptr), value :: sbuf
    end function
    !----------------------------------------------------------
    function mp_sbuffer_size (sbuf) bind (c)
      import c_size_t, c_ptr
      integer (c_size_t) :: mp_sbuffer_size
      type (c_ptr), value :: sbuf
    end function
    !----------------------------------------------------------
    subroutine mp_object_dump (o) bind (c)
      import c_ptr
      type (c_ptr), value :: o
    end subroutine


    !----------------------------------------------------------
    function mp_object_type (pmo) bind (c)
      import c_ptr, c_int
      integer(c_int) mp_object_type
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_boolean (pmo) bind (c)
      import c_ptr, c_bool
      logical(c_bool) mp_object_get_boolean
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_u64 (pmo) bind (c)
      import c_ptr, c_int64_t
      integer (c_int64_t) mp_object_get_u64
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_i64 (pmo) bind (c)
      import c_ptr, c_int64_t
      integer (c_int64_t) mp_object_get_i64
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_f64 (pmo) bind (c)
      import c_ptr, c_double
      real(c_double) mp_object_get_f64
      type(c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_array (pmo) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_get_array
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_map (pmo) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_get_map
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_str (pmo) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_get_str
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_bin (pmo) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_get_bin
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_get_ext (pmo) bind (c)
      import c_ptr, c_int
      type (c_ptr) :: mp_object_get_ext
      type (c_ptr), value :: pmo
    end function
    !----------------------------------------------------------
    function mp_object_array_size (pmparr) bind (c)
      import c_ptr, c_int32_t
      integer (c_int32_t) ::  mp_object_array_size
      type (c_ptr), value :: pmparr
    end function
    !----------------------------------------------------------
    function mp_object_array_get (pmparr, i) bind (c)
      import c_ptr, c_size_t
      type (c_ptr) :: mp_object_array_get
      type (c_ptr), value :: pmparr
      integer (c_size_t), value ::i
    end function
    !----------------------------------------------------------
    function mp_object_map_size (pmmap) bind (c)
      import c_ptr, c_int32_t
      integer (c_int32_t) mp_object_map_size
      type (c_ptr), value :: pmmap
    end function
    !----------------------------------------------------------
    function mp_object_map_kv (pmmap, i) bind (c)
      import c_ptr, c_size_t
      type (c_ptr) :: mp_object_map_kv
      type (c_ptr), value :: pmmap
      integer (c_size_t), value :: i
    end function
    !----------------------------------------------------------
    function mp_object_kv_key (pmkv) bind (c)
      import c_ptr, c_int
      type (c_ptr) :: mp_object_kv_key
      type (c_ptr), value :: pmkv
    end function
    !----------------------------------------------------------
    function mp_object_kv_val (pmkv) bind (c)
      import c_ptr, c_int
      type (c_ptr) :: mp_object_kv_val
      type (c_ptr), value :: pmkv
    end function
    !----------------------------------------------------------
    function mp_object_str_size (pmstr) bind (c)
      import c_ptr, c_int32_t
      integer (c_int32_t) mp_object_str_size
      type (c_ptr), value :: pmstr
    end function
    !----------------------------------------------------------
    function mp_object_str_ptr (pmstr) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_str_ptr
      type (c_ptr), value :: pmstr
    end function
    !----------------------------------------------------------
    function mp_object_bin_size (pmbin) bind (c)
      import c_ptr, c_int32_t
      integer (c_int32_t) mp_object_bin_size
      type (c_ptr), value :: pmbin
    end function
    !----------------------------------------------------------
    function mp_object_bin_ptr (pmbin) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_bin_ptr
      type (c_ptr), value :: pmbin
    end function
    !----------------------------------------------------------
    function mp_object_ext_type (pmext) bind (c)
      import c_ptr, c_int8_t
      integer (c_int8_t) :: mp_object_ext_type
      type (c_ptr) :: pmext
    end function
    !----------------------------------------------------------
    function mp_object_ext_size (pmext) bind (c)
      import c_ptr, c_int32_t
      integer (c_int32_t) :: mp_object_ext_size
      type (c_ptr), value :: pmext
    end function
    !----------------------------------------------------------
    function mp_object_ext_ptr (pmext) bind (c)
      import c_ptr
      type (c_ptr) :: mp_object_ext_ptr
      type (c_ptr), value :: pmext
    end function

  end interface

!==============================================================================
contains
  !=====================================================================
  !--------------------------------------------------------------------
  ! return the version string of the runtime of MessagePack library.
  function mp_version()
    character(len=:, kind=c_char), pointer :: mp_version
    mp_version => fstring(msgpack_version())
  end function

  !--------------------------------------------------------------------
  subroutine mp_packer_initialize (p)
    type (mp_packer), intent (out) :: p
    p % sbuf = msgpack_sbuffer_new()
    call msgpack_sbuffer_init (p % sbuf)
    p % pk = msgpack_packer_new(p % sbuf, c_funloc (msgpack_sbuffer_write))
  end subroutine

  !--------------------------------------------------------------------
  subroutine mp_packer_destroy (mpp)
    type (mp_packer), intent (inout) :: mpp
    call msgpack_packer_free (mpp % pk)
    call msgpack_sbuffer_free (mpp % sbuf)
    mpp % pk = c_null_ptr
    mpp % sbuf = c_null_ptr
  end subroutine

  !--------------------------------------------------------------------
  function mp_packer_ptr (mpp)
    type (mp_packer), intent (in) :: mpp
    type (c_ptr) :: mp_packer_ptr
    mp_packer_ptr = mp_sbuffer_ptr (mpp % sbuf)
  end function
  !--------------------------------------------------------------------
  function mp_packer_size (mpp)
    type (mp_packer), intent (in) :: mpp
    integer (c_size_t) :: mp_packer_size
    mp_packer_size = mp_sbuffer_size (mpp % sbuf)
  end function
  !--------------------------------------------------------------------
  subroutine mp_pack_array (mpp, len)
    type (mp_packer), intent (in) :: mpp
    integer, intent (in) :: len
    integer :: dummy
    ! msgpack_pack_* functions seem that don't return reasonable value.
    ! so I discard returned value.
    dummy = msgpack_pack_array (mpp % pk, int(len, kind=c_size_t))
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_pack_int (mpp, d)
    type (mp_packer), intent (in) :: mpp
    integer, intent(in) :: d
    integer :: dummy
    dummy = msgpack_pack_int (mpp % pk, int(d, kind=c_int))
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_pack_true (mpp)
    type (mp_packer), intent (in) :: mpp
    integer :: dummy
    dummy = msgpack_pack_true (mpp % pk)
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_pack_str (mpp, str)
    type (mp_packer), intent (in) :: mpp
    character(*) :: str
    integer (c_size_t) :: l
    integer :: dummy
    l = len(str)
    dummy = msgpack_pack_str (mpp % pk, l)
    dummy = msgpack_pack_str_body (mpp % pk, str, l)
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_packer_dump (mpp, path, errmsg)
    type (mp_packer), intent (in) :: mpp
    character(*), intent (in), optional :: path
    character(:), allocatable, intent(out), optional :: errmsg

    character(:), allocatable :: emsg
    integer :: f

    if (present (path)) then
      open (unit=f, file=path, status='replace', err=900)
    else 
      f = 6 ! STDOUT
    end if

    write (f, '(a)', advance='no', err=910) &
      convert_cptr (mp_sbuffer_ptr (mpp %sbuf), mp_sbuffer_size (mpp %sbuf))

    if (present (path)) then
      close (f)
    end if
    return
 
  900 emsg = "fail to open: " // path
    goto 999

  910 emsg = "fail to write"
    if (present (path)) then
      close (f)
      emsg = emsg // ": " // path
    end if
    goto 999

  999 continue ! something wrong.
    if (present (errmsg)) then
      errmsg = emsg
    else
      error stop emsg
    end if
  end subroutine

  !=====================================================================
  !--------------------------------------------------------------------
  subroutine mp_unpacker_initialize(up)
    type (mp_unpacker), intent (out) :: up
    up % up = msgpack_unpacked_new ()
    up % offset = 0
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_unpacker_destroy(up)
    type (mp_unpacker) :: up
    deallocate (up % src)
    call msgpack_unpacked_free (up % up)
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_unpacker_read (f, s, unpacker, errmsg)
    type (mp_unpacker), target, intent (out) :: unpacker
    integer, intent (in) :: f
    integer, intent (in) :: s
    character (:), allocatable, intent (out), optional :: errmsg

    character (:), allocatable :: em
    character(:), pointer :: p
    integer (c_size_t), pointer :: poff
    integer (c_size_t) :: r

    call mp_unpacker_initialize(unpacker)
    allocate (character(s) :: unpacker % src)
    read (f, err=999) unpacker % src
    p => unpacker % src
    poff => unpacker % offset
    if (MSGPACK_UNPACK_SUCCESS /= msgpack_unpack_next (unpacker % up, &
      c_loc(p), int(s, kind=c_size_t), c_loc(poff))) goto 999
    return
  999 em = "error on calling msgpack_unpack_next"
    if (present(errmsg)) then
      errmsg = em
    else
      error stop em
    end if
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_unpacker_read_from_file (path, unpacker, fd, errmsg)
    type (mp_unpacker), intent (out) :: unpacker
    character(*), intent (in) :: path
    integer, optional :: fd
    character (:), allocatable, intent (out), optional :: errmsg

    character (:), allocatable :: em
    integer :: f
    integer :: s

    if (present(fd)) then
      f = fd
    else
      f = 11
    end if
    inquire (file=path, size=s)
    open (unit=f, file=path, status='old', form='unformatted', &
      access='stream', err=900)
    call mp_unpacker_read (f, s, unpacker, em)
    close (f)
    if (allocated (em)) goto 910
    return

  900 em = "failure to open: " // path
    goto 999
  910 em = em // " while reading: " // path
    goto 999
  999 if (present (errmsg)) then
      errmsg = em
    else
      error stop em
    end if
  end subroutine
  !--------------------------------------------------------------------
  subroutine mp_unpacker_dump (up)
    type (mp_unpacker), intent (in) :: up
    call mp_object_dump (msgpack_unpacked_object (up % up))
  end subroutine

end module Msgpack

