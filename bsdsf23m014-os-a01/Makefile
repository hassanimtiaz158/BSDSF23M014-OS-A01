# Top-level Makefile
.PHONY: all include src clean

all: include src
	@echo "Root: Build finished."

include:
	@echo "Include: headers available"

src:
	$(MAKE) -C src

clean:
	$(MAKE) -C src clean
	rm -rf bin/* obj/* lib/*
	@echo "Root: cleaned"
