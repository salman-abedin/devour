.POSIX:

NAME    := devour

LDLIBS   += -lX11

PREFIX    ?= /usr/local/bin
BINPREFIX ?= $(PREFIX)/bin

SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)

all: $(NAME)
$(NAME): $(OBJ)
$(OBJ): $(SRC)

install:
	@mkdir -p "$(DESTDIR)$(BINPREFIX)"
	@cp -p $(NAME) "$(DESTDIR)$(BINPREFIX)"
uninstall:
	@rm -f "$(DESTDIR)$(BINPREFIX)/$(NAME)"
clean:
	@rm -f $(OBJ) $(NAME)

.PHONY: all install uninstall clean
