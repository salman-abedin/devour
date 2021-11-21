.POSIX:

NAME    = devour
VERSION = 11.0

CC     = cc
CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2
LDLIBS = -s -lX11

PREFIX = /usr/local

BIN_DIR = $(PREFIX)/bin
BASH_COMPLETION_DIR = $(PREFIX)/share/bash-completion/completions

SRC = devour.c
OBJ = devour.o

all: $(NAME)
$(NAME): $(OBJ)
install: all
	@mkdir -p $(BIN_DIR)
	@mv $(NAME) $(BIN_DIR)
	@rm -f $(OBJ)
	@echo Done moving the binary to ${DESTDIR}${BIN_DIR}
	@mkdir -p $(BASH_COMPLETION_DIR)
	@cp bash-completion.sh $(BASH_COMPLETION_DIR)/devour
	@echo Done moving bash completion to $(BASH_COMPLETION_DIR)
uninstall:
	@rm -f $(BIN_DIR)/$(NAME)
	@echo Done removing the binary from $(BIN_DIR)
	@rm -f $(BASH_COMPLETION_DIR)/devour
	@echo Done removing bash completion from $(BASH_COMPLETION_DIR)

.PHONY: all install uninstall
