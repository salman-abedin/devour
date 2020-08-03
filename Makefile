.POSIX:

NAME    := devour

LDLIBS   += -lX11

PREFIX    ?= /usr/local
BINPREFIX ?= ${PREFIX}/bin

SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)

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
