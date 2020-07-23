.POSIX:
PREFIX = /usr/local
install:
	@cp devour.sh devour
	@chmod 755 devour
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@mv devour ${DESTDIR}${PREFIX}/bin
	@echo Done installing executable files to ${DESTDIR}${PREFIX}/bin
uninstall:
	@rm -f ${DESTDIR}${PREFIX}/bin/devour
	@echo Done removing executable files from ${DESTDIR}${PREFIX}/bin
