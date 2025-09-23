# Simple Makefile for project
CC = gcc
CFLAGS = -Wall -g -Iinclude
LDFLAGS =
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c,obj/%.o,$(SRC))
BIN = mycat        # change to 'client' if assignment expects client

PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

.PHONY: all clean install uninstall

all: $(BIN)

# compile .c -> obj/.o
obj/%.o: src/%.c | obj
	$(CC) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p obj

# link
$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

clean:
	rm -rf obj/*.o $(BIN)

install: $(BIN)
	sudo mkdir -p $(BINDIR)
	sudo mkdir -p $(MANDIR)/man3
	sudo cp $(BIN) $(BINDIR)/
	# copy all man section 3 pages
	sudo cp -v man/man3/*.1 $(MANDIR)/man3/ 2>/dev/null || true
	-@sudo mandb 2>/dev/null || true

uninstall:
	-sudo rm -f $(BINDIR)/$(BIN)
	-sudo rm -f $(MANDIR)/man3/$(BIN).1
