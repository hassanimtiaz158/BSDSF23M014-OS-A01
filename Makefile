CC := gcc
CFLAGS := -Wall -g -Iinclude
LDFLAGS := 
BIN := client   # <--- program will be called "client"

# find all .c files under bsdsf23m014-os-a01/src
SRC := $(shell find bsdsf23m014-os-a01/src -type f -name '*.c' | sort)
OBJ := $(patsubst %.c,obj/%.o,$(SRC))

.PHONY: all clean install uninstall

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

obj/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf obj $(BIN)

install: $(BIN)
	install -d /usr/local/bin
	install -m 755 $(BIN) /usr/local/bin/
	install -d /usr/local/share/man/man1
	install -m 644 man/man3/mycat.1 /usr/local/share/man/man1/
	-@sudo mandb 2>/dev/null || true

uninstall:
	rm -f /usr/local/bin/$(BIN)
	rm -f /usr/local/share/man/man1/mycat.1
