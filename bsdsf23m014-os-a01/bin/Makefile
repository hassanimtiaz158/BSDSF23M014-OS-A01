CC = gcc
CFLAGS = -Wall -I../include
OBJDIR = ../obj
LIBDIR = ../lib
BINDIR = .

TARGET = myprogram

all: $(TARGET)

$(TARGET): $(OBJDIR)/main.o $(LIBDIR)/libmylib.a
	$(CC) $(CFLAGS) $(OBJDIR)/main.o -L$(LIBDIR) -lmylib -o $(TARGET)

clean:
	rm -f $(TARGET)
