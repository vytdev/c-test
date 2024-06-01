# Feel free to customize anything!
CC 	= gcc
CFLAGS 	= -std=c99 -Wall -Werror -pedantic -g
INCLUDE = # -I../include
LIBS    = # -L.. -lyourlib

SRCS  = $(shell find . -type f -name '*.c' ! -path './__test.c')
TESTS = $(basename $(SRCS))

.PHONY: all clean $(TESTS)
all: $(TESTS)
clean:
	rm -rf $(TESTS)
$(TESTS):
	$(CC) $(CFLAGS) $(INCLUDE) $(LIBS) -D _TESTSUITE='"$@"' __test.c $@.c -o $@ $($@)
	./$@

# You can define specific compiler arguments per test suite here.
#sample := -lm

