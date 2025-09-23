# Installation paths (standard locations)
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

# your existing build rules above...

install: client
	# create bin and man directories if not exist
	sudo mkdir -p $(BINDIR)
	sudo mkdir -p $(MANDIR)/man1
	sudo mkdir -p $(MANDIR)/man3

	# copy the compiled binary
	sudo cp client $(BINDIR)/

	# copy the man pages
	sudo cp man/man3/*.1 $(MANDIR)/man1/

	# update man database
	sudo mandb
