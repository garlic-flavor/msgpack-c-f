CLEANFILES = *.$(FC_MODEXT)
check_PROGRAMS = msgpacktest
msgpacktest_SOURCES = \
  msgpack_test.f08 \
  test.dat

msgpacktest_FCFLAGS = \
  '-I$(top_builddir)/src' \
  '-I$(top_builddir)/tests'
msgpacktest_LDFLAGS = \
  `pkg-config --cflags --libs msgpack-c` \
  -L$(top_builddir)/src
msgpacktest_LDADD = -lmsgpackcf
TESTS = msgpacktest

