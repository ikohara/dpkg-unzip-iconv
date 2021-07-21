Makefile for Debian unzip package with iconv
============================================

Build script for the unzip package with iconv patch in Debian
"testing" distribution.

This script downloads unzip-6.0-iconv.patch from
https://bugs.archlinux.org/task/18691#comment63168


Requirements
------------

* Debian "testing" distribution
* wget


Usage
-----

    $ make source
    $ sudo make build-dep
    $ make
    $ sudo make install


Notes
-----

If environment variables DEBEMAIL and DEBFULLNAME are not set, this script sets
them using git configuration user.email and user.name.

See https://www.debian.org/doc/manuals/debmake-doc/ch03.en.html about DEBEMAIL
and DEBFULLNAME.


License
-------

MIT License
