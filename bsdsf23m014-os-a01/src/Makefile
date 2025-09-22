# src/Makefile

CC = gcc
CFLAGS = -Wall -I../include -fPIC

SRCS = main.c
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)

LIBDIR = ../lib
BINDIR = ../bin
OBJDIR = ../obj

STATIC_LIB = $(LIBDIR)/libmyutils.a
SHARED_LIB = $(LIBDIR)/libmyutils.so

CLIENT_STATIC = $(BINDIR)/client_static
CLIENT_DYNAMIC = $(BINDIR)/client_dynamic

.PHONY: all clean static dynamic

all: static dynamic

# --- Build Static Client ---
static: $(CLIENT_STATIC)

$(CLIENT_STATIC): $(OBJS) $(STATIC_LIB)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(OBJS) -L$(LIBDIR) -lmyutils -o $@
	@echo "Created static client: $@"

# --- Build Dynamic Client ---
dynamic: $(CLIENT_DYNAMIC)

$(CLIENT_DYNAMIC): $(OBJS) $(SHARED_LIB)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(OBJS) -L$(LIBDIR) -lmyutils -Wl,-rpath,'$$ORIGIN/../lib' -o $@
	@echo "Created dynamic client: $@"

# --- Object files ---
$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# --- Clean ---
clean:
	rm -rf $(OBJDIR)/*.o $(BINDIR)/client_static $(BINDIR)/client_dynamic
	@echo "Cleaned build artifacts."
