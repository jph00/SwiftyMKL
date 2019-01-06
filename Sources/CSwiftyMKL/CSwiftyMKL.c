#include "include/CSwiftyMKL.h"

float smSum_32f(const float* restrict pSrc, int len) {
  float r = 0;
  #pragma clang loop interleave_count(8)
  for (int i=0; i<len; ++i) { r += pSrc[i]; }
  return r;
}

void smDivCRev_32f(const float* restrict pSrc, float val, float* restrict pDst, int len) {
  for (int i=0; i<len; i++) { pDst[i] = val/(pSrc[i]); }
}

void smDivCRev_64f(const double* restrict pSrc, double val, double* restrict pDst, int len) {
  for (int i=0; i<len; i++) { pDst[i] = val/pSrc[i]; }
}

