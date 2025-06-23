CC = g++
CXXFLAGS = -g -O0
LDFLAGS = -Wl,-z,lazy

target = hellocxx
src = $(wildcard *.cpp)
obj = $(src:.cpp=.o)

.PHONY: all clean
all: $(target)
$(target): $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)
clean:
	$(RM) $(obj) $(target)
