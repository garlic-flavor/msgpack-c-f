CLEANFILES = *.$(FC_MODEXT)
bin_PROGRAMS = msgpacktest
msgpacktest_SOURCES = \
  msgpack_test.f08
msgpacktest_FCFLAGS = '-I$(top_srcdir)/src'
msgpacktest_LDFLAGS = ../src/.libs/libmsgpackcf.a \
  `pkg-config --cflags --libs msgpack-c`
TESTS = msgpacktest

