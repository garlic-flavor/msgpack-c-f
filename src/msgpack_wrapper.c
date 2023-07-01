#include <msgpack.h>
#include <stdlib.h>

/** MessagePack wrapper (for Fortran).
 *
 * 2023 Hironori Ichikawa, some rights reserved.
 * lisence: MIT
 *
 * [MessagePack](https://msgpack.org)
 * [msgpack-c](https://github.com/msgpack/msgpack-c/tree/c_master)
 */

/* ------------------------------------------------------------------------- */
/* sbuffer.h
 */
void msgpack_sbuffer_init_wrapped(msgpack_sbuffer* sbuf) {
  msgpack_sbuffer_init (sbuf); }
void msgpack_sbuffer_destroy_wrapped(msgpack_sbuffer* sbuf) {
  msgpack_sbuffer_destroy_wrapped(sbuf); }
msgpack_sbuffer* msgpack_sbuffer_new_wrapped(void) {
  return msgpack_sbuffer_new(); }
void msgpack_sbuffer_free_wrapped(msgpack_sbuffer* sbuf) {
  msgpack_sbuffer_free(sbuf); }
int msgpack_sbuffer_write_wrapped(void* data, const char* buf, size_t len) {
  return msgpack_sbuffer_write(data, buf, len); }
char* msgpack_sbuffer_release_wrapped(msgpack_sbuffer* sbuf) {
  return msgpack_sbuffer_release(sbuf); }
void msgpack_sbuffer_clear_wrapped(msgpack_sbuffer* sbuf) {
  msgpack_sbuffer_clear(sbuf); }
/* --------------------------------------------------------------- */
char* mp_sbuffer_ptr (msgpack_sbuffer* sbuf) {
  return sbuf->data; }
size_t mp_sbuffer_size (msgpack_sbuffer* sbuf) {
  return sbuf->size; }

/* ------------------------------------------------------------------------- */
/* object.h
 */
msgpack_object* mp_object_new ();
void mp_object_destroy (msgpack_object* pmo);
void mp_object_clear (msgpack_object* pmo);
void mp_object_clear_str (msgpack_object_str* p);
void mp_object_clear_array (msgpack_object_array* p);
void mp_object_clear_map (msgpack_object_map* p);
void mp_object_clear_kv (msgpack_object_kv* p);
void mp_object_clear_bin (msgpack_object_bin* p);
void mp_object_clear_ext (msgpack_object_ext* p);
void mp_object_set_nil (msgpack_object* p);
void mp_object_set_boolean (msgpack_object* p, bool d);
void mp_object_set_integer (msgpack_object* p, int64_t d);
void mp_object_set_float (msgpack_object* p, double d);
void mp_object_set_string (msgpack_object* p, const char* d, size_t num);
void mp_object_set_array_num (msgpack_object* p, size_t num);
void mp_object_set_array (msgpack_object* p, size_t pos, msgpack_object* src);
void mp_object_set_map_num (msgpack_object* p, size_t num);
void mp_object_set_map (msgpack_object* p, size_t pos,
  msgpack_object* key, msgpack_object* val);
void mp_object_set_bin (msgpack_object* p, const char* src, size_t size);
void mp_object_set_ext (msgpack_object* p, int8_t type,
  const char* src, size_t size);

/* --------------------------------------------------------------- */
/** creation
 */
msgpack_object* mp_object_new () {
  return calloc(1, sizeof(msgpack_object));
}
/** free
 */
void mp_object_free (msgpack_object* pmo) {
  free (pmo);
}
/** destroy
 */
void mp_object_destroy (msgpack_object* pmo) {
  mp_object_clear (pmo);
  mp_object_free (pmo);
}
/** getter
 */
int mp_object_type (msgpack_object* pmo) {
  return pmo->type;
}
bool mp_object_get_boolean (msgpack_object* pmo) {
  return pmo->via.boolean;
}
uint64_t mp_object_get_u64 (msgpack_object* pmo) {
  return pmo->via.u64;
}
int64_t mp_object_get_i64 (msgpack_object* pmo) {
  return pmo->via.i64;
}
double mp_object_get_f64 (msgpack_object* pmo) {
  return pmo->via.f64;
}
msgpack_object_array* mp_object_get_array (msgpack_object* pmo) {
  return &(pmo->via.array);
}
msgpack_object_map* mp_object_get_map (msgpack_object* pmo) {
  return &(pmo->via.map);
}
msgpack_object_str* mp_object_get_str (msgpack_object* pmo) {
  return &(pmo->via.str);
}
msgpack_object_bin* mp_object_get_bin (msgpack_object* pmo) {
  return &(pmo->via.bin);
}
msgpack_object_ext* mp_object_get_ext (msgpack_object* pmo) {
  return &(pmo->via.ext);
}
uint32_t mp_object_array_size (msgpack_object_array* pmparr) {
  return pmparr->size;
}
msgpack_object* mp_object_array_get (msgpack_object_array* pmparr, size_t i) {
  return &(pmparr->ptr[i]);
}
uint32_t mp_object_map_size (msgpack_object_map* pmmap) {
  return pmmap->size;
}
msgpack_object_kv* mp_object_map_kv (msgpack_object_map* pmmap, size_t i) {
  return &(pmmap->ptr[i]);
}
msgpack_object* mp_object_kv_key (msgpack_object_kv* pmkv) {
  return &(pmkv->key);
}
msgpack_object* mp_object_kv_val (msgpack_object_kv* pmkv) {
  return &(pmkv->val);
}
uint32_t mp_object_str_size (msgpack_object_str* pmstr) {
  return pmstr->size;
}
const char* mp_object_str_ptr (msgpack_object_str* pmstr) {
  return pmstr->ptr;
}
uint32_t mp_object_bin_size (msgpack_object_bin* pmbin) {
  return pmbin->size;
}
const char* mp_object_bin_ptr (msgpack_object_bin* pmbin) {
  return pmbin->ptr;
}
int8_t mp_object_ext_type (msgpack_object_ext* pmext) {
  return pmext->type;
}
uint32_t mp_object_ext_size (msgpack_object_ext* pmext) {
  return pmext->size;
}
const char* mp_object_ext_ptr (msgpack_object_ext* pmext) {
  return pmext->ptr;
}

/**
 */
void mp_object_clear (msgpack_object* pmo) {
  if (pmo == NULL) { return; }
  switch (pmo->type) { 
    case MSGPACK_OBJECT_STR:
      mp_object_clear_str (&(pmo->via.str));
      break;
    case MSGPACK_OBJECT_ARRAY:
      mp_object_clear_array (&(pmo->via.array));
      break;
    case MSGPACK_OBJECT_MAP:
      mp_object_clear_map (&(pmo->via.map));
      break;
    case MSGPACK_OBJECT_BIN:
      mp_object_clear_bin (&(pmo->via.bin));
      break;
    case MSGPACK_OBJECT_EXT:
      mp_object_clear_ext (&(pmo->via.ext));
      break;
    default:
      break;
  }
}
/*
 */
void mp_object_clear_str (msgpack_object_str* p) {
  if (p->ptr == NULL) { return; }
  free ((void*)p->ptr);
  p->ptr = NULL;
  p->size = 0;
}
/*
 */
void mp_object_clear_array (msgpack_object_array* p) {
  if (p->ptr == NULL) { return; }
  for (size_t i = 0; i < p->size; ++i) {
    mp_object_clear(&(p->ptr[i]));
  }
  free (p->ptr);
  p->ptr = NULL;
  p->size = 0;
}
/*
 */
void mp_object_clear_map (msgpack_object_map* p) {
  for (size_t i = 0; i < p->size; ++i) {
    mp_object_clear_kv (&(p->ptr[i]));
  }
  free (p->ptr);
  p->ptr = NULL;
  p->size = 0;
}
/*
 */
void mp_object_clear_kv (msgpack_object_kv* p) {
  mp_object_clear(&p->key);
  mp_object_clear(&p->val);
}
/*
 */
void mp_object_clear_bin (msgpack_object_bin* p) {
  free ((void*)p->ptr);
  p->ptr = NULL;
  p->size = 0;
}
/*
 */
void mp_object_clear_ext (msgpack_object_ext* p) {
  free ((void*)p->ptr);
  p->ptr = NULL;
  p->size = 0;
  p->type = 0;
}

/**
 */
void mp_object_set_nil (msgpack_object* p) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_NIL;
}
/**
 */
void mp_object_set_boolean (msgpack_object* p, bool d) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_BOOLEAN;
  p->via.boolean = d;
}
/**
 */
void mp_object_set_integer (msgpack_object* p, int64_t d) {
  mp_object_clear(p);
  if (0 <= d) {
    p->type = MSGPACK_OBJECT_POSITIVE_INTEGER;
  } else {
    p->type = MSGPACK_OBJECT_NEGATIVE_INTEGER;
  }
  p->via.i64 = d;
}
/**
 */
void mp_object_set_float (msgpack_object* p, double d) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_FLOAT;
  p->via.f64 = d;
}
/**
 */
void mp_object_set_string (msgpack_object* p, const char* d, size_t num) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_STR;
  p->via.str.size = num;
  p->via.str.ptr = malloc (sizeof(char) * num);
  memcpy ((void*)p->via.str.ptr, d, num);
}
/**
 */
void mp_object_set_array_num (msgpack_object* p, size_t num) {
  if (p->type == MSGPACK_OBJECT_ARRAY) {
    if (num <= p->via.array.size) {
      return;
    }
    p->via.array.ptr = realloc (p->via.array.ptr, sizeof(msgpack_object)*num);
  } else {
    mp_object_clear(p);
    p->type = MSGPACK_OBJECT_ARRAY;
    p->via.array.ptr = calloc (sizeof(msgpack_object), num);
  }
  p->via.array.size = num;
}
/**
 */
void mp_object_set_array (msgpack_object* p, size_t pos, msgpack_object* src) {
  if (p->type != MSGPACK_OBJECT_ARRAY || p->via.array.size <= pos) {
    mp_object_set_array_num (p, pos + 1);
  }
  memcpy (&(p->via.array.ptr[pos]), src, sizeof (msgpack_object));
}

/**
 */
void mp_object_set_map_num (msgpack_object* p, size_t num) {
  if (p->type == MSGPACK_OBJECT_MAP) {
    if (num <= p->via.map.size) {
      return;
    }
    p->via.map.ptr = realloc (p->via.map.ptr, sizeof(msgpack_object_kv)*num);
  } else {
    mp_object_clear(p);
    p->type = MSGPACK_OBJECT_MAP;
    p->via.map.ptr = calloc (sizeof (msgpack_object_kv), num);
  }
  p->via.map.size = num;
}
/**
 */
void mp_object_set_map (msgpack_object* p, size_t pos,
  msgpack_object* key, msgpack_object* val) {
  if (p->type != MSGPACK_OBJECT_MAP || p->via.map.size <= pos) {
    mp_object_set_map_num (p, pos + 1);
  }
  memcpy (&(p->via.map.ptr[pos].key), key, sizeof (msgpack_object));
  memcpy (&(p->via.map.ptr[pos].val), val, sizeof (msgpack_object));
}

/**
 */
void mp_object_set_bin (msgpack_object* p, const char* src, size_t size) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_BIN;
  p->via.bin.size = size;
  p->via.bin.ptr = malloc (sizeof(char) * size);
  memcpy ((void*)p->via.bin.ptr, src, sizeof(char) * size);
}

/**
 */
void mp_object_set_ext (msgpack_object* p, int8_t type,
  const char* src, size_t size) {
  mp_object_clear(p);
  p->type = MSGPACK_OBJECT_EXT;
  p->via.ext.type = type;
  p->via.ext.size = size;
  p->via.ext.ptr = malloc (sizeof(char) * size);
  memcpy ((void*)p->via.ext.ptr, src, sizeof(char) * size);
}
/**
 */
void mp_object_dump (msgpack_object* o) {
  msgpack_object_print (stdout, *o);
  printf ("\n");
}

/* ------------------------------------------------------------------------- */
/* pack.h
 */
int msgpack_pack_char_wrapped(msgpack_packer* pk, char d) {
  return msgpack_pack_char(pk, d); }
int msgpack_pack_signed_char_wrapped(msgpack_packer* pk, signed char d) {
  return msgpack_pack_signed_char(pk, d); }
int msgpack_pack_short_wrapped(msgpack_packer* pk, short d) {
  return msgpack_pack_short(pk, d); }
int msgpack_pack_int_wrapped(msgpack_packer* pk, int d) {
  return msgpack_pack_int(pk, d); }
int msgpack_pack_long_wrapped(msgpack_packer* pk, long d) {
  return msgpack_pack_long(pk, d); }
int msgpack_pack_long_long_wrapped(msgpack_packer* pk, long long d) {
  return msgpack_pack_long_long(pk, d); }
int msgpack_pack_unsigned_char_wrapped(msgpack_packer* pk, unsigned char d) {
  return msgpack_pack_unsigned_char(pk, d); }
int msgpack_pack_unsigned_short_wrapped(msgpack_packer* pk, unsigned short d){
  return msgpack_pack_unsigned_short(pk, d); }
int msgpack_pack_unsigned_int_wrapped(msgpack_packer* pk, unsigned int d) {
  return msgpack_pack_unsigned_int(pk, d); }
int msgpack_pack_unsigned_long_wrapped(msgpack_packer* pk, unsigned long d){
  return msgpack_pack_unsigned_long(pk, d); }
int msgpack_pack_unsigned_long_long_wrapped(msgpack_packer* pk,
  unsigned long long d) { return msgpack_pack_unsigned_long_long(pk, d); }
int msgpack_pack_uint8_wrapped(msgpack_packer* pk, uint8_t d) {
  return msgpack_pack_uint8(pk, d); }
int msgpack_pack_uint16_wrapped(msgpack_packer* pk, uint16_t d){
  return msgpack_pack_uint16(pk, d); }
int msgpack_pack_uint32_wrapped(msgpack_packer* pk, uint32_t d) {
  return msgpack_pack_uint32(pk, d); }
int msgpack_pack_uint64_wrapped(msgpack_packer* pk, uint64_t d) {
  return msgpack_pack_uint64(pk, d); }
int msgpack_pack_int8_wrapped(msgpack_packer* pk, int8_t d) {
  return msgpack_pack_int8(pk, d); }
int msgpack_pack_int16_wrapped(msgpack_packer* pk, int16_t d) {
  return msgpack_pack_int16(pk, d); }
int msgpack_pack_int32_wrapped(msgpack_packer* pk, int32_t d) {
  return msgpack_pack_int32(pk, d); }
int msgpack_pack_int64_wrapped(msgpack_packer* pk, int64_t d) {
  return msgpack_pack_int64(pk, d); }
int msgpack_pack_fix_uint8_wrapped(msgpack_packer* pk, uint8_t d){
  return msgpack_pack_fix_uint8(pk, d); }
int msgpack_pack_fix_uint16_wrapped(msgpack_packer* pk, uint16_t d){
  return msgpack_pack_fix_uint16(pk, d); }
int msgpack_pack_fix_uint32_wrapped(msgpack_packer* pk, uint32_t d) {
  return msgpack_pack_fix_uint32(pk, d); }
int msgpack_pack_fix_uint64_wrapped(msgpack_packer* pk, uint64_t d) {
  return msgpack_pack_fix_uint64(pk, d); }
int msgpack_pack_fix_int8_wrapped(msgpack_packer* pk, int8_t d) {
  return msgpack_pack_fix_int8(pk, d); }
int msgpack_pack_fix_int16_wrapped(msgpack_packer* pk, int16_t d){
  return msgpack_pack_fix_int16(pk, d); }
int msgpack_pack_fix_int32_wrapped(msgpack_packer* pk, int32_t d) {
  return msgpack_pack_fix_int32(pk, d); }
int msgpack_pack_fix_int64_wrapped(msgpack_packer* pk, int64_t d) {
  return msgpack_pack_fix_int64(pk, d); }
int msgpack_pack_float_wrapped(msgpack_packer* pk, float d) {
  return msgpack_pack_float(pk, d); }
int msgpack_pack_double_wrapped(msgpack_packer* pk, double d) {
  return msgpack_pack_double(pk, d); }
int msgpack_pack_nil_wrapped(msgpack_packer* pk) {
  return msgpack_pack_nil(pk); }
int msgpack_pack_true_wrapped(msgpack_packer* pk) {
  return msgpack_pack_true(pk); }
int msgpack_pack_false_wrapped(msgpack_packer* pk) {
  return msgpack_pack_false(pk); }
int msgpack_pack_array_wrapped(msgpack_packer* pk, size_t n) {
  return msgpack_pack_array(pk, n); }
int msgpack_pack_map_wrapped(msgpack_packer* pk, size_t n) {
  return msgpack_pack_map(pk, n); }
int msgpack_pack_str_wrapped(msgpack_packer* pk, size_t l) {
  return msgpack_pack_str(pk, l); }
int msgpack_pack_str_body_wrapped(msgpack_packer* pk, const void* b, size_t l){
  return msgpack_pack_str_body(pk, b, l); }
int msgpack_pack_v4raw_wrapped(msgpack_packer* pk, size_t l){
  return msgpack_pack_v4raw(pk, l); }
int msgpack_pack_v4raw_body_wrapped(msgpack_packer* pk, const void* b,
  size_t l) { return msgpack_pack_v4raw_body(pk, b, l); }
int msgpack_pack_bin_wrapped(msgpack_packer* pk, size_t l){
  return msgpack_pack_bin(pk, l); }
int msgpack_pack_bin_body_wrapped(msgpack_packer* pk, const void* b, size_t l){
  return msgpack_pack_bin_body(pk, b, l); }
int msgpack_pack_ext_wrapped(msgpack_packer* pk, size_t l, int8_t type){
  return msgpack_pack_ext(pk, l, type); }
int msgpack_pack_ext_body_wrapped(msgpack_packer* pk, const void* b, size_t l){
  return msgpack_pack_ext_body(pk, b, l); }

void msgpack_packer_init_wrapped (msgpack_packer* pk, void* data,
  msgpack_packer_write callback) {
  msgpack_packer_init(pk, data, callback); }
msgpack_packer* msgpack_packer_new_wrapped (void* data,
  msgpack_packer_write callback) {
  return msgpack_packer_new(data, callback); }
void msgpack_packer_free_wrapped (msgpack_packer* pk) {
  return msgpack_packer_free(pk); }
int msgpack_pack_object_wrapped(msgpack_packer* pk, msgpack_object* d) {
  msgpack_object payload;
  memcpy (&payload, d, sizeof(msgpack_object));
  return msgpack_pack_object(pk, payload);
}
/* ------------------------------------------------------------------------- */
/* unpack.h
 */
bool msgpack_unpacker_reserve_buffer_wrapped (msgpack_unpacker* mpac,
  size_t size) { return msgpack_unpacker_reserve_buffer(mpac, size); }
char* msgpack_unpacker_buffer_wrapped (msgpack_unpacker* mpac) {
  return msgpack_unpacker_buffer(mpac); }
size_t msgpack_unpacker_buffer_capacity_wrapped (const msgpack_unpacker* mpac){
  return msgpack_unpacker_buffer_capacity(mpac); }
void msgpack_unpacker_buffer_consumed_wrapped (msgpack_unpacker* mpac,
  size_t size) { msgpack_unpacker_buffer_consumed(mpac, size); }
size_t msgpack_unpacker_message_size_wrapped (const msgpack_unpacker* mpac) {
  return msgpack_unpacker_message_size(mpac); }
size_t msgpack_unpacker_parsed_size_wrapped (const msgpack_unpacker* mpac) {
  return msgpack_unpacker_parsed_size(mpac); }
void msgpack_unpacked_init_wrapped(msgpack_unpacked* result) {
  msgpack_unpacked_init(result); }
void msgpack_unpacked_destroy_wrapped (msgpack_unpacked* result) {
  msgpack_unpacked_destroy(result); }
msgpack_zone* msgpack_unpacked_release_zone_wrapped(msgpack_unpacked* result){
  return msgpack_unpacked_release_zone(result); }

/*
 */
msgpack_unpacked* msgpack_unpacked_new () {
  msgpack_unpacked* res;
  res = calloc(1, sizeof(msgpack_unpacked));
  msgpack_unpacked_init (res);
  return res;
}
/*
 */
void msgpack_unpacked_free (msgpack_unpacked* up){
  msgpack_unpacked_destroy (up);
  free (up);
}

/*
 */
msgpack_object* msgpack_unpacked_object(msgpack_unpacked* up) {
  return &(up->data);
}

/* ------------------------------------------------------------------------- */
/* zone.h
 */
void* msgpack_zone_malloc_no_align_wrapped(msgpack_zone* zone, size_t size) {
  return msgpack_zone_malloc_no_align(zone, size); }
void* msgpack_zone_malloc_wrapped(msgpack_zone* zone, size_t size) {
  return msgpack_zone_malloc(zone, size); }
bool msgpack_zone_push_finalizer_wrapped(msgpack_zone* zone,
        void (*func)(void* data), void* data) {
  return msgpack_zone_push_finalizer(zone, func, data); }
void msgpack_zone_swap_wrapped(msgpack_zone* a, msgpack_zone* b) {
  return msgpack_zone_swap(a, b); }

/* ------------------------------------------------------------------------- */
/* vrefbuffer.h
 */
msgpack_vrefbuffer* msgpack_vrefbuffer_new_wrapped(size_t ref_size,
  size_t chunk_size) { return msgpack_vrefbuffer_new(ref_size, chunk_size); }
void msgpack_vrefbuffer_free_wrapped(msgpack_vrefbuffer* vbuf) {
  msgpack_vrefbuffer_free(vbuf); }
int msgpack_vrefbuffer_write_wrapped(void* data, const char* buf, size_t len){
  return msgpack_vrefbuffer_write(data, buf, len); }
const struct iovec* msgpack_vrefbuffer_vec_wrapped(
  const msgpack_vrefbuffer* vref) { return msgpack_vrefbuffer_vec(vref); }
size_t msgpack_vrefbuffer_veclen_wrapped(const msgpack_vrefbuffer* vref) {
  return msgpack_vrefbuffer_veclen(vref); }


