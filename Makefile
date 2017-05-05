# dsearch - dmenu based frontend 
# See LICENSE file for copyright and license details.

PREFIX = /usr/local

install:
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp dsearch ${DESTDIR}${PREFIX}/bin/dsearch
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dsearch
	@mkdir -p ${DESTDIR}${PREFIX}/share/dsearch
	@cp -Rf handlers/* ${DESTDIR}${PREFIX}/share/dsearch/ 
	@cp -Rf youtube ${DESTDIR}${PREFIX}/share/dsearch/
	@chmod -R 755 ${DESTDIR}${PREFIX}/share/dsearch/*

.PHONY: install
