# dsearch - dmenu based frontend 
# See LICENSE file for copyright and license details.

PREFIX ?= /usr/local

HANDLER = \
	code \
	docs \
	g \
	game \
	gh \
	godoc \
	is \
	link \
	lyrics \
	man \
	math \
	mpvl \
	np \
	pb \
	pkg \
	quote \
	rec \
	reddit \
	rq \
	rss \
	save \
	song \
	w \
	yt \ 

install:
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@sed "s|/usr/local/share|${DESTDIR}${PREFIX}/share|" dsearch > ${DESTDIR}${PREFIX}/bin/dsearch
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dsearch
	@mkdir -p ${DESTDIR}${PREFIX}/share/dsearch
	@for i in ${OTHER}; do \
		sed "s|/usr/local/share/dsearch/|${DESTDIR}${PREFIX}/share/dsearch|g" handlers/$$i > ${DESTDIR}${PREFIX}/share/dsearch/$$i; \
		chmod -R 755 ${DESTDIR}${PREFIX}/share/dsearch/$$i; \
	done

.PHONY: install
