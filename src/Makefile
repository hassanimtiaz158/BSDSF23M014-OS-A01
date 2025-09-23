CC = gcc
CFLAGS = -Wall -g -Iinclude
LDFLAGS = 
BIN = mycat

SRC = $(wildcard bsdsf23m014-os-a01/src/*.c)
OBJ = $(patsubst bsdsf23m014-os-a01/src/%.c,obj/%.o,$(SRC))

.PHONY: all clean install uninstall

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

obj/%.o: bsdsf23m014-os-a01/src/%.c
	mkdir -p obj
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf obj $(BIN)

install: $(BIN)
	install -d /usr/local/bin
	install -m 755 $(BIN) /usr/local/bin/
	install -d /usr/local/share/man/man1
	install -m 644 man/man3/$(BIN).1 /usr/local/share/man/man1/

uninstall:
	rm -f /usr/local/bin/$(BIN)
	rm -f /usr/local/share/man/man1/$(BIN).1
