#include "Arduino.h"

extern "C" {

#include <idris_support.h>

void sysi_prepare() {
  Serial.begin(9600);
}

void idris2_putStr(char *str) {
  Serial.print(str);
}

}
