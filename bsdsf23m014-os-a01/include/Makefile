# include/Makefile

# List of header files
HEADERS = mystrfunctions.h myfilefunctions.h
INCLUDEDIR = $(abspath .)

.PHONY: all clean install

# Just show what headers exist
all:
	@echo "Headers are available: $(HEADERS)"

# Optionally allow "make install" to copy headers into a system/include dir
install:
	@echo "Installing headers to /usr/local/include..."
	@for header in $(HEADERS); do \
		cp $$header /usr/local/include/; \
	done

# Nothing to clean here
clean:
	@echo "Nothing to clean in include/"
