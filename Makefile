.POSIX:

NAME    = devour
VERSION = 11.0

CC     = cc

# Leave as it is to compile on Linux
CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2

# To compile on BSD uncomment this line and comment the line above.
# CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2 -I/usr/local/include -L/usr/local/lib

LDLIBS = -s -lX11

BIN_DIR = /usr/local/bin

SRC = devour.c
OBJ = devour.o

all: $(NAME)
$(NAME): $(OBJ)
install: all
	@mkdir -p $(BIN_DIR)
	@mv $(NAME) $(BIN_DIR)
	@rm -f $(OBJ)
	@echo Done moving the binary to ${DESTDIR}${BIN_DIR}
uninstall:
	@rm -f $(BIN_DIR)/$(NAME)
	@echo Done removing the binary from $(BIN_DIR)

.PHONY: all install uninstall
