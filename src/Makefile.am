CLEANFILES = *.$(FC_MODEXT)
pkglib_LTLIBRARIES = libmsgpackcf.la
libmsgpackcf_la_SOURCES = msgpack_wrapper.c libc.f08 msgpack.f08
nodist_pkginclude_HEADERS = \
  msgpack_raw.mod \
  msgpack.mod \
  libc.mod

msgpack_raw.mod: msgpack.mod
