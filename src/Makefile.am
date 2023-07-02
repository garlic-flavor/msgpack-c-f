CLEANFILES = *.$(FC_modext)
package = @PACKAGE_NAME@
libdir = ${prefix}/lib/${package}
includedir = ${prefix}/include/${package}
lib_LTLIBRARIES = libmsgpackcf.la
libmsgpackcf_la_SOURCES = msgpack_wrapper.c libc.f08 msgpack.f08
include_HEADERS = \
  msgpack_raw.mod \
  msgpack.mod \
  libc.mod

