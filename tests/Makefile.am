CLEANFILES = *.$(FC_MODEXT)
check_PROGRAMS = msgpacktest
msgpacktest_SOURCES = \
  config.f90 \
  msgpack_test.f08 \
  test.dat
msgpacktest_FCFLAGS = '-I$(top_builddir)/src'
msgpacktest_LDFLAGS = \
  `pkg-config --cflags --libs msgpack-c` \
  -L$(top_builddir)/src
msgpacktest_LDADD = -lmsgpackcf
TESTS = msgpacktest

