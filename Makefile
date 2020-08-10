NAME    = devour
VERSION = 10.0

CC     = cc
CFLAGS = -Wall -std=c99 -pedantic
LDLIBS = -lX11

BINPREFIX ?= /usr/local/bin

OBJ := $(SRC:.c=.o)
SRC := $(wildcard *.c)

all: options ${NAME}
options:
	@echo ${NAME} build options:
	@echo "CFLAGS = ${CFLAGS}"
	@echo "LDLIBS = ${LDLIBS}"
	@echo "CC     = ${CC}"
${NAME}: ${OBJ}
${OBJ}: ${SRC}
install: all
	@mkdir -p "${DESTDIR}${BINPREFIX}"
	@mv ${NAME} "${DESTDIR}${BINPREFIX}"
	@echo Done moving the binary to ${DESTDIR}${BINPREFIX}
uninstall:
	@rm -f "${DESTDIR}${BINPREFIX}/${NAME}"
	@echo Done removing the binary from ${DESTDIR}${BINPREFIX}
clean:
	@rm -f ${OBJ} ${NAME}
	@echo Done cleaning the source

.PHONY: all options install uninstall clean
