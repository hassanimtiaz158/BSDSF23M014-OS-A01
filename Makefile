PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

# build target (example)
all: mycat

mycat: $(OBJ)        # or list source objects or rule to build mycat
	$(CC) $(CFLAGS) -o mycat $(OBJ) $(LDFLAGS)

install: mycat
	sudo mkdir -p $(BINDIR)
	sudo mkdir -p $(MANDIR)/man3
	sudo cp mycat $(BINDIR)/mycat
	sudo cp -v man/man3/*.1 $(MANDIR)/man3/
	# optional: update man-db (may not exist on all systems)
	-@sudo mandb 2>/dev/null || true

uninstall:
	-sudo rm -f $(BINDIR)/mycat
	-sudo rm -f $(MANDIR)/man3/mycat.1
