# Top-level Makefile

.PHONY: all clean include src

all: include src
	@echo "Build complete!"

include:
	$(MAKE) -C include

src:
	$(MAKE) -C src

clean:
	$(MAKE) -C src clean
	$(MAKE) -C include clean
	rm -rf bin/* obj/*
