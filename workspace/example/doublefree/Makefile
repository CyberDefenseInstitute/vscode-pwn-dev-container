CC = gcc
CFLAGS = -g -O0
LDFLAGS = -Wl,-z,lazy

target = doublefree
src = $(wildcard *.c)
obj = $(src:.c=.o)

.PHONY: all clean
all: $(target)
$(target): $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)
clean:
	$(RM) $(obj) $(target)
