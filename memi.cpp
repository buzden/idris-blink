#include "Arduino.h"
#include <malloc.h>

#include "memi.h"

extern "C" {

void printPrepare() {
  Serial.begin(9600);
}

void printMemInfo() {
  Serial.println(F("Memory info"));

  struct mallinfo i = mallinfo();

  Serial.print(F("  total space allocated from system: "));
  Serial.print(i.arena);
  Serial.println();

  Serial.print(F("  number of non-inuse chunks: "));
  Serial.print(i.ordblks);
  Serial.println();

  Serial.print(F("  total allocated space: "));
  Serial.print(i.uordblks);
  Serial.println();

  Serial.print(F("  total non-inuse space: "));
  Serial.print(i.fordblks);
  Serial.println();

  Serial.print(F("  top-most, releasable (via malloc_trim) space: "));
  Serial.print(i.keepcost);
  Serial.println();
}

void printAllocMem() {
  struct mallinfo i = mallinfo();

  Serial.print(F("Total allocated space: "));
  Serial.print(i.uordblks);
  Serial.println();
}

}
