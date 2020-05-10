ADRUINO_DIR=/usr/share/arduino
AVR_TOOLS_DIR=/usr
AVRDUDE_CONF=/etc/avrdude.conf
IDRIS_RTS_PATH=$(realpath ../arduino-avr-idris-rts/rts)
ARDUINO_MAKEFILE_PATH=/usr/share/arduino-mk/Arduino.mk

IDRIS_MAIN=Blink.idr

BOARD_TAG=mega
BOARD_SUB=atmega2560

include Idris.mk
