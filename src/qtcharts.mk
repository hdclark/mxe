# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtcharts
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := fbece915316d6c64987296d1f163f7d85f96ca4f4e68f27dec6d11391dfabeb3
$(PKG)_SUBDIR    = $(subst qtbase,qtcharts,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtcharts,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtcharts,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qtdeclarative qtmultimedia

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
