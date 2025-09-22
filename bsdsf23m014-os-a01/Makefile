# Top-level Makefile (root)
.PHONY: all include src lib clean

all: include src
	@echo "Root build complete."

include:
	@echo "Include folder (headers) checked."

# Call src Makefile (which builds objects and library and binary)
src:
	$(MAKE) -C src

clean:
	$(MAKE) -C src clean
	rm -rf bin/* obj/* lib/*
	@echo "Top-level clean complete."
