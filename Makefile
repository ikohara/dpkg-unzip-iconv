DEBEMAIL ?= $(shell git config --get user.email)
DEBFULLNAME ?= $(shell git config --get user.name)

PATCH_FILE = unzip-6.0-iconv.patch

-include source.mk

all: $(PATCH_FILE)
	cp $< $(SOURCE_DIR)/debian/patches/
	echo $< >> $(SOURCE_DIR)/debian/patches/series
	(cd $(SOURCE_DIR); \
	DEBEMAIL="$(DEBEMAIL)" DEBFULLNAME="$(DEBFULLNAME)" \
	debchange -liconv "Apply iconv patch"; \
	dpkg-buildpackage -rfakeroot -us -uc)

install:
	dpkg -i *.deb

clean:
	$(RM) -r $(SOURCE_DIR) *.patch
	$(RM) *.tar.* *.dsc *.mk *.deb *.build *.changes *.buildinfo

build-dep:
	apt-get install devscripts
	apt-get build-dep unzip

source: source.mk $(PATCH_FILE)

source.mk:
	apt-get source unzip
	echo SOURCE_DIR = unzip-6.0 > $@

$(PATCH_FILE):
	wget -O $@ "https://bugs.archlinux.org/task/18691?getfile=5410"

.PHONY: all install clean bulid-dep source
