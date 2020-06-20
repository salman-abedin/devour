install:
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@for e in *.sh; do \
		cp -f $$e ${DESTDIR}${PREFIX}/bin; \
		chmod 755 ${DESTDIR}${PREFIX}/bin/$$e; \
		mv ${DESTDIR}${PREFIX}/bin/$$e ${DESTDIR}${PREFIX}/bin/$${e%.*}; \
		done

uninstall:
	@echo removing executable files from ${DESTDIR}${PREFIX}/bin
	@for e in *.sh;do \
		rm -f ${DESTDIR}${PREFIX}/bin/$${e%.*}; \
		done
