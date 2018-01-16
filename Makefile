CC = gcc

CFLAGS = -Wall

SRC = pgconfjdbc.c

OBJ = $(SRC:.c=.o)

LIBS = -lpq

MAIN = pgconfjdbc

$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJ) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJ)

distclean: clean
	@rm -f $(MAIN)
