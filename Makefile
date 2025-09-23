# Robust Makefile for your repo (works with nested src path)
CC := gcc
CFLAGS := -Wall -g -Iinclude
LDFLAGS :=
BIN := mycat

# find all .c files under bsdsf23m014-os-a01/src
SRC := $(shell find bsdsf23m014-os-a01/src -type f -name '*.c' | sort)

# object names: convert path/to/foo.c -> obj/path/to/foo.o (preserve subdirs)
OBJ := $(patsubst %.c,obj/%.o,$(SRC))

.PHONY: all clean install uninstall

all: $(BIN)

# link
$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

# compile rule: create needed obj directories then compile
obj/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf obj $(BIN)

install: $(BIN)
	install -d /usr/local/bin
	install -m 755 $(BIN) /usr/local/bin/
	install -d /usr/local/share/man/man3
	install -m 644 man/man3/$(BIN).1 /usr/local/share/man/man3/ 2>/dev/null || true
	-@sudo mandb 2>/dev/null || true

uninstall:
	-sudo rm -f /usr/local/bin/$(BIN)
	-sudo rm -f /usr/local/share/man/man3/$(BIN).1
