#include <stdint.h>
#include <stdio.h>
#include <time.h>

void init() {
}

void digitalWrite(uint8_t p, uint8_t v) {
  printf("digitalWrite %d %d\n", p, v);
}

void pinMode(uint8_t p, uint8_t m) {
  printf("pinMode %d %d\n", p, m);
}

void delay(uint32_t t) {
  printf("delay %d\n", t);
}

uint32_t millis() {
  struct timespec tp;
  clock_gettime(CLOCK_MONOTONIC, &tp);
  return (tp.tv_sec * 1000) + (tp.tv_nsec / 1000000);
}
