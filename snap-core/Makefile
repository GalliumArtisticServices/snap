#
# Small makefile for testing with non-Microsoft compilers
#

include ../Makefile.config

all: testSnap

testSnap: testSnap.cpp Snap.o 
	$(CC) $(CXXFLAGS) -o testSnap testSnap.cpp Snap.o -I$(CGLIB) $(LDFLAGS) $(LIBS)

Snap.o: *.h *.cpp ../glib-core/*.h ../glib-core/*.cpp
	$(CC) -c $(CXXFLAGS) Snap.cpp -I$(CGLIB)

lib: Snap.o
	rm -f libsnap.a
	ar -cvq libsnap.a Snap.o

libinstall: lib
  ifeq ($(IOS_BUILD), 1)
	mkdir -p $(INSTALL_PATH)/iphoneos
	cp libsnap.a $(INSTALL_PATH)/iphoneos/libsnap.a
  else ifeq ($(TVOS_BUILD), 1)
	mkdir -p $(INSTALL_PATH)/appletvos
	cp libsnap.a $(INSTALL_PATH)/appletvos/libsnap.a
  else
	mkdir -p $(INSTALL_PATH)/macosx
	cp libsnap.a $(INSTALL_PATH)/macosx/libsnap.a
  endif

clean:
	rm -f *.o *.a testSnap testSnap.exe *.plt *.tab *.png

