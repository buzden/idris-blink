#ifndef __ARDUINO_H__
#define __ARDUINO_H__

#include <stdint.h>

void init();
void digitalWrite(uint8_t p, uint8_t v);
void pinMode(uint8_t p, uint8_t m);
void delay(uint32_t t);
uint32_t millis();

#endif // __ARDUINO_H__
