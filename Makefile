ARDUINO_PACKAGE_DIR := $(HOME)/.arduino15/packages
ADRUINO_DIR=/usr/share/arduino
IDRIS_RTS_PATH=$(realpath ../arduino-sam-idris-rts/rts)
ARDUINO_MAKEFILE_PATH=/usr/share/arduino-mk/Sam.mk

IDRIS_MAIN=Blink.idr

BOARD_TAG=arduino_due_x
ARCHITECTURE=sam

include Idris.mk
