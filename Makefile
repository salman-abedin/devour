.POSIX:

NAME    = devour
VERSION = 10.0

CC     = cc
LDLIBS = -lX11

BINPREFIX = /usr/local/bin

OBJ = devour.o
SRC = devour.c

all: $(NAME)
$(NAME): $(OBJ)
install: all
	@mkdir -p "$(DESTDIR)$(BINPREFIX)"
	@mv $(NAME) "$(DESTDIR)$(BINPREFIX)"
	@rm -f $(OBJ)
	@echo Done moving the binary to ${DESTDIR}${BINPREFIX}
uninstall:
	@rm -f "$(DESTDIR)$(BINPREFIX)/$(NAME)"
	@echo Done removing the binary from ${DESTDIR}${BINPREFIX}
.PHONY: all install uninstall
