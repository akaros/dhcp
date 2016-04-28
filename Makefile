# Rules: keep this simple. Make sure the gcc is in your path and nobody gets hurt.

### Build flags for all targets
#
CFLAGS          = -O2 -std=gnu99 -fno-stack-protector -fgnu89-inline -Wsystem-headers -fPIC -static -fno-omit-frame-pointer -g -Iinclude 
LDFLAGS          =
LDLIBS         = -lpthread -lbenchutil -lm -liplib -lndblib
DEST	= $(AKAROS)/kern/kfs/bin

### Build tools
#
CC=x86_64-ucb-akaros-gcc
AR=x86_64-ucb-akaros-ar

all: dhcpc

install: all
	echo "Installing $@ in $(DEST)"
	cp dhcpc $(DEST)

# compilers are fast. Just rebuild it each time.
dhcpc: FORCE
	$(CC) $(CFLAGS) $(LDFLAGS) -o dhcpc dhcpc.c $(LDLIBS)

FORCE:

clean:
	rm -f dhcp *.o

# this is intended to be idempotent, i.e. run it all you want.
gitconfig:
	echo "nothing to see here, move along"


