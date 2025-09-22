# src/Makefile
# Build static and dynamic libraries and two clients (static & dynamic)

CC = gcc
CFLAGS = -I../include -Wall -Wextra
PICFLAGS = -fPIC
AR = ar
ARFLAGS = rcs
SRCDIR = .
OBJDIR = ../obj
LIBDIR = ../lib
BINDIR = ../bin

# source files (adjust names if different)
SRCS = mystrfunctions.c myfilefunctions.c
MAIN = main.c

# objects (compile library sources with/without PIC depending on target)
OBJ = $(SRCS:%.c=$(OBJDIR)/%.o)
MAIN_OBJ = $(OBJDIR)/main.o

LIB_STATIC = $(LIBDIR)/libmyutils.a
LIB_SHARED = $(LIBDIR)/libmyutils.so

CLIENT_STATIC = $(BINDIR)/client_static
CLIENT_DYNAMIC = $(BINDIR)/client_dynamic

.PHONY: all static dynamic clean

# default: build both (dynamic focus since assignment requests dynamic)
all: static dynamic

# ------------------------
# static build
# ------------------------
static: $(LIB_STATIC) $(CLIENT_STATIC)
	@echo "Static build: $(CLIENT_STATIC) created"

# archive static library
$(LIB_STATIC): $(OBJ)
	@mkdir -p $(LIBDIR)
	$(AR) $(ARFLAGS) $@ $(OBJ)
	@echo "Created static library: $@"

$(CLIENT_STATIC): $(MAIN_OBJ) $(LIB_STATIC)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@
	@echo "Created static client: $@"

# ------------------------
# dynamic build
# ------------------------
dynamic: $(LIB_SHARED) $(CLIENT_DYNAMIC)
	@echo "Dynamic build: $(CLIENT_DYNAMIC) created"

# shared library: compile sources as PIC objects, then link shared
# compile PIC objects (object rule below will create OBJDIR if needed)
$(LIB_SHARED): $(SRCS:%.c=$(OBJDIR)/%.pic.o)
	@mkdir -p $(LIBDIR)
	$(CC) -shared -o $@ $(SRCS:%.c=$(OBJDIR)/%.pic.o)
	@echo "Created shared library: $@"

# build dynamic client by linking main.o to the shared lib
# note: at link time the linker will prefer .so if present in -L path
$(CLIENT_DYNAMIC): $(MAIN_OBJ) $(LIB_SHARED)
	@mkdir -p $(BINDIR)
	# Do not embed rpath here (we'll show LD_LIBRARY_PATH method). To embed rpath use -Wl,-rpath etc.
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@
	@echo "Created dynamic client: $@"

# ------------------------
# compilation rules
# ------------------------
# normal object for non-PIC (used by static lib)
$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# PIC object for shared library
$(OBJDIR)/%.pic.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) $(PICFLAGS) -c $< -o $@

# main.o build (used for both builds)
$(MAIN_OBJ): $(MAIN)
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $(MAIN) -o $(MAIN_OBJ)

# clean
clean:
	rm -rf $(OBJDIR)/*.o $(OBJDIR)/*.pic.o $(LIBDIR)/libmyutils.* $(BINDIR)/client_* 
	@echo "src: cleaned objects, libs and clients"
