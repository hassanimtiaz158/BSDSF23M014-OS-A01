# include/Makefile

# List of header files
HEADERS = mystrfunctions.h myfilefunctions.h
INCLUDEDIR = $(abspath .)

.PHONY: all clean install uninstall

# Show available headers
all:
	@echo "Headers are available for dynamic linking: $(HEADERS)"

# Install headers to system include dir (optional for dynamic libs)
install:
	@echo "Installing headers to /usr/local/include..."
	@for header in $(HEADERS); do \
		cp $$header /usr/local/include/; \
	done
	@echo "Export this directory when compiling with -I/usr/local/include"

# Uninstall headers from system include dir
uninstall:
	@echo "Removing installed headers from /usr/local/include..."
	@for header in $(HEADERS); do \
		rm -f /usr/local/include/$$header; \
	done

# Nothing to clean here
clean:
	@echo "Nothing to clean in include/"
