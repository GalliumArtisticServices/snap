#
# Makefile for non-Microsoft compilers
#

all: MakeAll

test: TestAll

MakeAll:
	$(MAKE) -C snap-core
	$(MAKE) -C examples

TestAll:
	$(MAKE) run -C test

clean:
	$(MAKE) clean -C snap-core
	$(MAKE) clean -C examples
	$(MAKE) clean -C test
	$(MAKE) clean -C tutorials

ios:
	$(MAKE) IOS_BUILD=1 -C snap-core
	$(MAKE) -C snap-core lib
	$(MAKE) IOS_BUILD=1 -C snap-core libinstall
osx:
	$(MAKE) -C snap-core
	$(MAKE) -C snap-core lib
	$(MAKE) -C snap-core libinstall
tvos:
	$(MAKE) TVOS_BUILD=1 -C snap-core
	$(MAKE) -C snap-core lib
	$(MAKE) TVOS_BUILD=1 -C snap-core libinstall
