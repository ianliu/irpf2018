prefix ?= $(HOME)/.local
bindir ?= $(prefix)/bin
datadir ?= $(prefix)/share

all: build-docker

build-docker: Dockerfile docker-entrypoint.sh checksum
	docker build -t irpf2018 .

irpf2018.desktop: irpf2018.desktop.in
	sed -e 's|@DATADIR@|$(datadir)|' \
		-e 's|@BINDIR@|$(bindir)|' \
		$^ > $@

irpf2018: irpf2018.in
	sed -e 's|@DATADIR@|$(datadir)|' \
		-e 's|@BINDIR@|$(bindir)|' \
		$^ > $@

install: irpf2018 irpf2018.desktop
	install -d $(DESTDIR)$(bindir)
	install -d $(DESTDIR)$(datadir)/irpf2018/
	install -d $(DESTDIR)$(datadir)/applications/
	install -m 644 irpf2018.desktop $(DESTDIR)$(datadir)/applications/
	install -m 644 icon.png $(DESTDIR)$(datadir)/irpf2018/
	install -m 755 irpf2018 $(DESTDIR)$(bindir)
