# src/Makefile
# Builds object files, archives static library lib/libmyutils.a and builds bin/client_static

CC = gcc
CFLAGS = -I../include -Wall -Wextra -fPIC
AR = ar
ARFLAGS = rcs

SRCDIR = .
OBJDIR = ../obj
LIBDIR = ../lib
BINDIR = ../bin

# All .c in src that implement utilities (exclude main if you want main separate)
# Adjust names if your files have different names
SRCS = mystrfunctions.c myfilefunctions.c
SRCS_ALL = $(SRCS) main.c

# Objects for library (exclude main.o)
LIB_OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)
# main object
MAIN_OBJ = $(OBJDIR)/main.o

# library name
LIBNAME = $(LIBDIR)/libmyutils.a

# final executable built using static lib
TARGET = $(BINDIR)/client_static

.PHONY: all library clean

all: library $(TARGET)

# Build static library (ensure object files exist)
library: $(LIBNAME)

# Archive library from lib object files
$(LIBNAME): $(LIB_OBJS)
	@mkdir -p $(LIBDIR)
	$(AR) $(ARFLAGS) $@ $(LIB_OBJS)
	@echo "Created static library: $@"

# Build the target by linking main.o with the static library
$(TARGET): $(MAIN_OBJ) $(LIBNAME)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@
	@echo "Built executable: $@"

# Generic rule to compile source .c into object files in ../obj
$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean objects, library and binary produced by src
clean:
	rm -rf $(OBJDIR)/*.o $(LIBDIR)/libmyutils.a $(BINDIR)/client_static
	@echo "cleaned src artifacts (obj, lib and binary)"

