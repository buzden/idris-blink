ARDUINO_PACKAGE_DIR := $(HOME)/.arduino15/packages
ADRUINO_DIR=/usr/share/arduino

IDRIS_SUPPORT_SRC_PATH=rts

IDRIS_MAIN=Blink.idr

# Choose the board you have
#include aux-makefiles/board-uno.mk
include aux-makefiles/board-mega2560.mk
#include aux-makefiles/board-due.mk

include aux-makefiles/Idris2.mk

#####################
### blink on host ###
#####################

IDRIS_VERSION=0.2.1
IDRIS_INSTALL_PREFIX=/home/buzden/.idris2

# TODO to get those variables from above from the `idris2 --paths` and `idris --version` calls.

IDRIS_WD="${IDRIS_INSTALL_PREFIX}/idris2-${IDRIS_VERSION}"

blink-on-host: build/exec/Blink.c libarduino-host-ersatz/*
	gcc build/exec/Blink.c -o blink-on-host \
		-I"${IDRIS_WD}/refc/"    "${IDRIS_WD}/refc/libidris2_refc.a" \
		-I"${IDRIS_WD}/include/" "${IDRIS_WD}/lib/libidris2_support.a" \
		-Ilibarduino-host-ersatz libarduino-host-ersatz/libarduino.c
