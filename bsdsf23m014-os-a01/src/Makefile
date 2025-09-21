# src/Makefile

# Macros
CC = gcc
CFLAGS = -I../include -Wall -Wextra
OBJDIR = ../obj
BINDIR = ../bin

SRCS = main.c mystrfunctions.c myfilefunctions.c
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/myprogram

# Default target
all: $(TARGET)

# Linking final executable
$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJS) -o $(TARGET)

# Compiling .c into .o
$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(TARGET)
