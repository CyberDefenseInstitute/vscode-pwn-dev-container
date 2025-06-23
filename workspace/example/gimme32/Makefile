CC = gcc
CFLAGS = -g -m32 -O0
LDFLAGS = -m32

target = gimme32
src = $(wildcard *.c)
obj = $(src:.c=.o)

.PHONY: all clean
all: $(target)
$(target): $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)
clean:
	$(RM) $(obj) $(target)
