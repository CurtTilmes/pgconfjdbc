CC = gcc

SRC = pgconfjdbc.c

OBJ = $(SRC:.c=.o)

INCDIR = $(shell pg_config --includedir)

CFLAGS = -Wall -I $(INCDIR)

LIBS = -Bstatic -lpq -Bdynamic

MAIN = pgconfjdbc

$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJ) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJ)

distclean: clean
	@rm -f $(MAIN)
