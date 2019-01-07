#include "include/CSwiftyMKL.h"
#include <math.h>

float smSum_float(const float* restrict pSrc, int len) {
  float r = 0;
  #pragma clang loop interleave(enable)
  for (int i=0; i<len; ++i) { r += pSrc[i]; }
  return r;
}
double smSum_double(const double* restrict pSrc, int len) {
  double r = 0;
  #pragma clang loop interleave(enable)
  for (int i=0; i<len; ++i) { r += pSrc[i]; }
  return r;
}

