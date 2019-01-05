#include "ipp.h"
#include "mkl.h"

Ipp32f smSum_32f(const Ipp32f* restrict pSrc, int len);
void smDivCRev_32f(const Ipp32f* restrict pSrc, Ipp32f val, Ipp32f* restrict pDst, int len);
void smDivCRev_64f(const Ipp64f* restrict pSrc, Ipp64f val, Ipp64f* restrict pDst, int len);

