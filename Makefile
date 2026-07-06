CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11 $(shell pkg-config --cflags check)

SRC=NAME.c
OBJ=$(SRC:.c=.o)
LIB=NAME.a
TEST_FLAGS = $(shell pkg-config --libs check)
MAIN=main.c
TEST_SRC=test/TEST.c
CFLAGS_GCOV=$(CFLAGS) --coverage
LDFLAGS_GCOV=--coverage
MAKE=make

all: $(LIB)
 
$(LIB): $(OBJ)
	ar rcs $(LIB) $(OBJ)

test: $(LIB) $(TEST_SRC)
	$(CC) $(CFLAGS) -I. $(TEST_SRC) $(LIB) $(TEST_FLAGS) -o test_exec
	./test_exec

gcov_report:
	$(MAKE) clean
	$(CC) $(CFLAGS_GCOV) $(SRC) $(TEST_SRC) $(TEST_FLAGS) $(LDFLAGS_GCOV) -o test_gcov
	./test_gcov
	lcov -c -d . -o coverage.info --ignore-errors mismatch --no-external
	genhtml coverage.info -o report
	open report/index.html

main: $(LIB) $(MAIN)
	$(CC) $(CFLAGS) $(MAIN) $(LIB) -o app

.PHONY: all clean fclean test gcov_report main

format:
	find . -name "*.c" -o -name "*.h" | xargs clang-format -i

clean:
	rm -f *.o $(LIB) app test_exec test_gcov
	rm -rf report coverage.info

fclean: clean
	rm -f *.gcda *.gcno
	find . -name "*.gcda" -delete
	find . -name "*.gcno" -delete