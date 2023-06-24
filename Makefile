#!/usr/bin/env make
CC = clang
FC = gfortran
TARGET = msgpack_test
DEPENDINGS = msgpack_wrapper.o libc.o msgpack.o msgpack_test.o
CFLAGS = -g
FFLAGS = -g
LDLIBS = `pkg-config --libs msgpack-c`

%.o : %.f*
	$(FC) -c $(FFLAGS) -o $@ $<

$(TARGET) : $(DEPENDINGS)
	$(FC) $(LDFLAGS) -o $@ $+ $(LOADLIBES) $(LDLIBS)

run:
	./$(TARGET)

clean :
	rm $(TARGET) *.o *.mod
