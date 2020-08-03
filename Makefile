.POSIX:

NAME    := devour

CFLAGS   += -std=c99
LDLIBS   += -lX11

BINPREFIX ?= /usr/local/bin

OBJ := $(SRC:.c=.o)
SRC := $(wildcard *.c)

all: ${NAME}
${NAME}: ${OBJ}
${OBJ}: ${SRC}

install:
	@mkdir -p "${DESTDIR}${BINPREFIX}"
	@cp -p ${NAME} "${DESTDIR}${BINPREFIX}"
	@echo Done moving the binary to ${DESTDIR}${BINPREFIX}
uninstall:
	@rm -f "${DESTDIR}${BINPREFIX}/${NAME}"
	@echo Done removing the binary from ${DESTDIR}${BINPREFIX}
clean:
	@rm -f ${OBJ} ${NAME}
	@echo Done cleaning the source

.PHONY: all install uninstall clean
