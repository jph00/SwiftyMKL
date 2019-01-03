#include "include/CSwiftyMKL.h"

void smDivCRev_32f(const Ipp32f* restrict pSrc, Ipp32f val, Ipp32f* restrict pDst, int len) {
  pSrc = __builtin_assume_aligned(pSrc, 64);
  pDst = __builtin_assume_aligned(pDst, 64);
  #pragma clang loop vectorize_width(4) interleave_count(4)
  for (int i=0; i<len; i++) { pDst[i] = val/pSrc[i]; }
}

void smDivCRev_64f(const Ipp64f* restrict pSrc, Ipp64f val, Ipp64f* restrict pDst, int len) {
  pSrc = __builtin_assume_aligned(pSrc, 64);
  pDst = __builtin_assume_aligned(pDst, 64);
  #pragma clang loop vectorize_width(4) interleave_count(4)
  for (int i=0; i<len; i++) { pDst[i] = val/pSrc[i]; }
}

