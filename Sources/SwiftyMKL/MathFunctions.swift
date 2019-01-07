import Foundation
import CSwiftyMKL
import CIPL


public protocol SupportsMKL:BinaryFloatingPoint {
  typealias Element=Self
  typealias PtrT = UnsafePointer<Element> 
  typealias MutPtrT = UnsafeMutablePointer<Element>

  init(_ value: Self)
  init()

  func min(_ b: Self) -> Self
  func max(_ b: Self) -> Self
  func pow(_ b: Self) -> Self
  func atan2(_ b: Self) -> Self
  func copysign(_ b: Self) -> Self
  func fdim(_ b: Self) -> Self
  func fmax(_ b: Self) -> Self
  func fmin(_ b: Self) -> Self
  func hypot(_ b: Self) -> Self
  func nextafter(_ b: Self) -> Self
  func acos() -> Self
  func acosh() -> Self
  func asin() -> Self
  func asinh() -> Self
  func atan() -> Self
  func atanh() -> Self
  func cbrt() -> Self
  func cos() -> Self
  func cosh() -> Self
  func erf() -> Self
  func erfc() -> Self
  func exp() -> Self
  func exp2() -> Self
  func expm1() -> Self
  func log() -> Self
  func log10() -> Self
  func log1p() -> Self
  func log2() -> Self
  func logb() -> Self
  func nearbyint() -> Self
  func rint() -> Self
  func sin() -> Self
  func sinh() -> Self
  func tan() -> Self
  func tanh() -> Self
  func tgamma() -> Self

  static func sum(_ pSrc:PtrT, _ len:Int)
  static func dot(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int)->Element
  static func doti(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->Element
  static func nrm2(_ N:Int, _ X:PtrT, _ incX:Int)->Element
  static func asum(_ N:Int, _ X:PtrT, _ incX:Int)->Element
  static func swap(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int)
  static func copy(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int)
  static func axpy(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int)
  static func axpby(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func axpyi(_ N:Int, _ alpha:Element, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT)
  static func gthr(_ N:Int, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>)
  static func gthrz(_ N:Int, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>)
  static func sctr(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT)
  static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT)
  static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:Element, _ P:MutPtrT)
  static func rot(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ c:Element, _ s:Element)
  static func roti(_ N:Int, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:Element, _ s:Element)
  static func rotm(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ P:PtrT)
  static func scal(_ N:Int, _ alpha:Element, _ X:MutPtrT, _ incX:Int)
  static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int)
  static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int)
  static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int)
  static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int)
  static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int)
  static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int)
  static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ Ap:PtrT, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int)
  static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int)
  static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ A:MutPtrT, _ lda:Int)
  static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Ap:MutPtrT)
  static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int)
  static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT)
  static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int)
  static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int)
  static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ N:Int, _ K:Int)->Int32
  static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ src:PtrT, _ ld:Int, _ dest:MutPtrT)
  static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int)
  static func gemm_free(_ dest:MutPtrT)
  static func abs(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func add(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func sub(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func inv(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func invSqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func invCbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sqr(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func exp(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func exp2(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func exp10(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func expm1(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func ln(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func log2(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func log10(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func log1p(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func logb(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cos(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sin(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func tan(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cospi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func tanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cosd(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sind(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func tand(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cosh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func sinh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func tanh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func acos(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func asin(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func atan(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func acospi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func asinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func atanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func acosh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func asinh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func atanh(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func erf(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func erfInv(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func hypot(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func erfc(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func erfcInv(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cdfNorm(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func cdfNormInv(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func lGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func tGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func atan2(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func atan2pi(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func mul(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func div(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow3o2(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func pow2o3(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func powx(_ n:Int, _ a:PtrT, _ b:Element, _ r:MutPtrT)
  static func powr(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func sinCos(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func linearFrac(_ n:Int, _ a:PtrT, _ b:PtrT, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:MutPtrT)
  static func ceil(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func floor(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func frac(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func modf(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmod(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func remainder(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func nextAfter(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func copySign(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fdim(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmax(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmin(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func maxMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func minMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func nearbyInt(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func rint(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func round(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func trunc(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func expInt1(_ n:Int, _ a:PtrT, _ r:MutPtrT)
  static func packI(_ n:Int, _ a:PtrT, _ incra:Int, _ y:MutPtrT)
  static func packV(_ n:Int, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT)
  static func packM(_ n:Int, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT)
  static func unpackI(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ incry:Int)
  static func unpackV(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>)
  static func unpackM(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>)
  static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func set(_ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func zero(_ pDst:MutPtrT, _ len:Int)
  static func triangle(_ pDst:MutPtrT, _ len:Int, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:MutPtrT)
  static func vectorJaehne(_ pDst:MutPtrT, _ len:Int, _ magn:Element)
  static func vectorSlope(_ pDst:MutPtrT, _ len:Int, _ offset:Element, _ slope:Element)
  static func addC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int)
  static func mulC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func subC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func subCRev(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func divC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int)
  static func sumLn(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT)
  static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ vSub:Element, _ vDiv:Element)
  static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element)
  static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element)
  static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element)
  static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element)
  static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element)
  static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element)
  static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element)
  static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element)
  static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element)
  static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int)
  static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int)
  static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element)
  static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int)
  static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element)
  static func sum(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT)
  static func min(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT)
  static func max(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT)
  static func minMax(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMax:MutPtrT)
  static func minAbs(_ pSrc:PtrT, _ len:Int, _ pMinAbs:MutPtrT)
  static func maxAbs(_ pSrc:PtrT, _ len:Int, _ pMaxAbs:MutPtrT)
  static func minIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>)
  static func maxIndx(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>)
  static func minMaxIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>)
  static func mean(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT)
  static func stdDev(_ pSrc:PtrT, _ len:Int, _ pStdDev:MutPtrT)
  static func meanStdDev(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT, _ pStdDev:MutPtrT)
  static func norm_Inf(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func norm_L1(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func norm_L2(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT)
  static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pDp:MutPtrT)
  static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32)
  static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32)
  static func maxOrder(_ pSrc:PtrT, _ len:Int, _ pOrder:UnsafeMutablePointer<Int32>)
  static func sampleUp(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>)
  static func sampleDown(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>)
  static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ maskSize:Int, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>)
  static func rngCauchy(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngUniform(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngGaussian(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngGaussianMV(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ dimen:Int, _ mstorage:Int32, _ a:PtrT, _ t:PtrT)->Int32
  static func rngExponential(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngLaplace(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngWeibull(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32
  static func rngRayleigh(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngLognormal(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32
  static func rngGumbel(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32
  static func rngGamma(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32
  static func rngBeta(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32
}

extension Float : SupportsMKL {
  public func min(_ b: Float) -> Float {return Swift.min(self, b)}
  public func max(_ b: Float) -> Float {return Swift.max(self, b)}

  public static func sum(_ pSrc:PtrT, _ len:Int) {smSum_float(pSrc,numericCast(len))}
  public static func dot(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int)->Element {return cblas_sdot(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func doti(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->Element {return cblas_sdoti(numericCast(N),X,indx,Y)}
  public static func nrm2(_ N:Int, _ X:PtrT, _ incX:Int)->Element {return cblas_snrm2(numericCast(N),X,numericCast(incX))}
  public static func asum(_ N:Int, _ X:PtrT, _ incX:Int)->Element {return cblas_sasum(numericCast(N),X,numericCast(incX))}
  public static func swap(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_sswap(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func copy(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_scopy(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func axpy(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_saxpy(numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY))}
  public static func axpby(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_saxpby(numericCast(N),alpha,X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func axpyi(_ N:Int, _ alpha:Element, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {cblas_saxpyi(numericCast(N),alpha,X,indx,Y)}
  public static func gthr(_ N:Int, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {cblas_sgthr(numericCast(N),Y,X,indx)}
  public static func gthrz(_ N:Int, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {cblas_sgthrz(numericCast(N),Y,X,indx)}
  public static func sctr(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {cblas_ssctr(numericCast(N),X,indx,Y)}
  public static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT) {cblas_srotg(a,b,c,s)}
  public static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:Element, _ P:MutPtrT) {cblas_srotmg(d1,d2,b1,b2,P)}
  public static func rot(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ c:Element, _ s:Element) {cblas_srot(numericCast(N),X,numericCast(incX),Y,numericCast(incY),c,s)}
  public static func roti(_ N:Int, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:Element, _ s:Element) {cblas_sroti(numericCast(N),X,indx,Y,c,s)}
  public static func rotm(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ P:PtrT) {cblas_srotm(numericCast(N),X,numericCast(incX),Y,numericCast(incY),P)}
  public static func scal(_ N:Int, _ alpha:Element, _ X:MutPtrT, _ incX:Int) {cblas_sscal(numericCast(N),alpha,X,numericCast(incX))}
  public static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_sgemv(Layout,TransA,numericCast(M),numericCast(N),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_sgbmv(Layout,TransA,numericCast(M),numericCast(N),numericCast(KL),numericCast(KU),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_strmv(Layout,Uplo,TransA,Diag,numericCast(N),A,numericCast(lda),X,numericCast(incX))}
  public static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_stbmv(Layout,Uplo,TransA,Diag,numericCast(N),numericCast(K),A,numericCast(lda),X,numericCast(incX))}
  public static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {cblas_stpmv(Layout,Uplo,TransA,Diag,numericCast(N),Ap,X,numericCast(incX))}
  public static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_strsv(Layout,Uplo,TransA,Diag,numericCast(N),A,numericCast(lda),X,numericCast(incX))}
  public static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_stbsv(Layout,Uplo,TransA,Diag,numericCast(N),numericCast(K),A,numericCast(lda),X,numericCast(incX))}
  public static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {cblas_stpsv(Layout,Uplo,TransA,Diag,numericCast(N),Ap,X,numericCast(incX))}
  public static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_ssymv(Layout,Uplo,numericCast(N),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_ssbmv(Layout,Uplo,numericCast(N),numericCast(K),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ Ap:PtrT, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_sspmv(Layout,Uplo,numericCast(N),alpha,Ap,X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {cblas_sger(Layout,numericCast(M),numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A,numericCast(lda))}
  public static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ A:MutPtrT, _ lda:Int) {cblas_ssyr(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),A,numericCast(lda))}
  public static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Ap:MutPtrT) {cblas_sspr(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Ap)}
  public static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {cblas_ssyr2(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A,numericCast(lda))}
  public static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT) {cblas_sspr2(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A)}
  public static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_sgemm(Layout,TransA,TransB,numericCast(M),numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_sgemmt(Layout,Uplo,TransA,TransB,numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_ssymm(Layout,Side,Uplo,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_ssyrk(Layout,Uplo,Trans,numericCast(N),numericCast(K),alpha,A,numericCast(lda),beta,C,numericCast(ldc))}
  public static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_ssyr2k(Layout,Uplo,Trans,numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {cblas_strmm(Layout,Side,Uplo,TransA,Diag,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb))}
  public static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {cblas_strsm(Layout,Side,Uplo,TransA,Diag,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb))}
  public static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ N:Int, _ K:Int)->Int32 {return cblas_sgemm_pack_get_size(identifier,numericCast(M),numericCast(N),numericCast(K))}
  public static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ src:PtrT, _ ld:Int, _ dest:MutPtrT) {cblas_sgemm_pack(Layout,identifier,Trans,numericCast(M),numericCast(N),numericCast(K),alpha,src,numericCast(ld),dest)}
  public static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_sgemm_compute(Layout,numericCast(TransA),numericCast(TransB),numericCast(M),numericCast(N),numericCast(K),A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func gemm_free(_ dest:MutPtrT) {cblas_sgemm_free(dest)}
  public static func abs(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAbs(numericCast(n),a,r)}
  public static func add(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsAdd(numericCast(n),a,b,r)}
  public static func sub(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsSub(numericCast(n),a,b,r)}
  public static func inv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsInv(numericCast(n),a,r)}
  public static func sqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSqrt(numericCast(n),a,r)}
  public static func invSqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsInvSqrt(numericCast(n),a,r)}
  public static func cbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCbrt(numericCast(n),a,r)}
  public static func invCbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsInvCbrt(numericCast(n),a,r)}
  public static func sqr(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSqr(numericCast(n),a,r)}
  public static func exp(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsExp(numericCast(n),a,r)}
  public static func exp2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsExp2(numericCast(n),a,r)}
  public static func exp10(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsExp10(numericCast(n),a,r)}
  public static func expm1(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsExpm1(numericCast(n),a,r)}
  public static func ln(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLn(numericCast(n),a,r)}
  public static func log2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLog2(numericCast(n),a,r)}
  public static func log10(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLog10(numericCast(n),a,r)}
  public static func log1p(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLog1p(numericCast(n),a,r)}
  public static func logb(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLogb(numericCast(n),a,r)}
  public static func cos(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCos(numericCast(n),a,r)}
  public static func sin(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSin(numericCast(n),a,r)}
  public static func tan(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTan(numericCast(n),a,r)}
  public static func cospi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCospi(numericCast(n),a,r)}
  public static func sinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSinpi(numericCast(n),a,r)}
  public static func tanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTanpi(numericCast(n),a,r)}
  public static func cosd(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCosd(numericCast(n),a,r)}
  public static func sind(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSind(numericCast(n),a,r)}
  public static func tand(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTand(numericCast(n),a,r)}
  public static func cosh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCosh(numericCast(n),a,r)}
  public static func sinh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsSinh(numericCast(n),a,r)}
  public static func tanh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTanh(numericCast(n),a,r)}
  public static func acos(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAcos(numericCast(n),a,r)}
  public static func asin(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAsin(numericCast(n),a,r)}
  public static func atan(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAtan(numericCast(n),a,r)}
  public static func acospi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAcospi(numericCast(n),a,r)}
  public static func asinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAsinpi(numericCast(n),a,r)}
  public static func atanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAtanpi(numericCast(n),a,r)}
  public static func acosh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAcosh(numericCast(n),a,r)}
  public static func asinh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAsinh(numericCast(n),a,r)}
  public static func atanh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsAtanh(numericCast(n),a,r)}
  public static func erf(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsErf(numericCast(n),a,r)}
  public static func erfInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsErfInv(numericCast(n),a,r)}
  public static func hypot(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsHypot(numericCast(n),a,b,r)}
  public static func erfc(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsErfc(numericCast(n),a,r)}
  public static func erfcInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsErfcInv(numericCast(n),a,r)}
  public static func cdfNorm(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCdfNorm(numericCast(n),a,r)}
  public static func cdfNormInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCdfNormInv(numericCast(n),a,r)}
  public static func lGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsLGamma(numericCast(n),a,r)}
  public static func tGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTGamma(numericCast(n),a,r)}
  public static func atan2(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsAtan2(numericCast(n),a,b,r)}
  public static func atan2pi(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsAtan2pi(numericCast(n),a,b,r)}
  public static func mul(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsMul(numericCast(n),a,b,r)}
  public static func div(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsDiv(numericCast(n),a,b,r)}
  public static func pow(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsPow(numericCast(n),a,b,r)}
  public static func pow3o2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsPow3o2(numericCast(n),a,r)}
  public static func pow2o3(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsPow2o3(numericCast(n),a,r)}
  public static func powx(_ n:Int, _ a:PtrT, _ b:Element, _ r:MutPtrT) {vsPowx(numericCast(n),a,b,r)}
  public static func powr(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vsPowr(numericCast(n),a,b,r)}
  public static func sinCos(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsSinCos(numericCast(n),a,r1,r2)}
  public static func linearFrac(_ n:Int, _ a:PtrT, _ b:PtrT, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:MutPtrT) {vsLinearFrac(numericCast(n),a,b,scalea,shifta,scaleb,shiftb,r)}
  public static func ceil(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsCeil(numericCast(n),a,r)}
  public static func floor(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsFloor(numericCast(n),a,r)}
  public static func frac(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsFrac(numericCast(n),a,r)}
  public static func modf(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsModf(numericCast(n),a,r1,r2)}
  public static func fmod(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsFmod(numericCast(n),a,r1,r2)}
  public static func remainder(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsRemainder(numericCast(n),a,r1,r2)}
  public static func nextAfter(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsNextAfter(numericCast(n),a,r1,r2)}
  public static func copySign(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsCopySign(numericCast(n),a,r1,r2)}
  public static func fdim(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsFdim(numericCast(n),a,r1,r2)}
  public static func fmax(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsFmax(numericCast(n),a,r1,r2)}
  public static func fmin(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsFmin(numericCast(n),a,r1,r2)}
  public static func maxMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsMaxMag(numericCast(n),a,r1,r2)}
  public static func minMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vsMinMag(numericCast(n),a,r1,r2)}
  public static func nearbyInt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsNearbyInt(numericCast(n),a,r)}
  public static func rint(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsRint(numericCast(n),a,r)}
  public static func round(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsRound(numericCast(n),a,r)}
  public static func trunc(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsTrunc(numericCast(n),a,r)}
  public static func expInt1(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vsExpInt1(numericCast(n),a,r)}
  public static func packI(_ n:Int, _ a:PtrT, _ incra:Int, _ y:MutPtrT) {vsPackI(numericCast(n),a,numericCast(incra),y)}
  public static func packV(_ n:Int, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) {vsPackV(numericCast(n),a,ia,y)}
  public static func packM(_ n:Int, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) {vsPackM(numericCast(n),a,ma,y)}
  public static func unpackI(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ incry:Int) {vsUnpackI(numericCast(n),a,y,numericCast(incry))}
  public static func unpackV(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>) {vsUnpackV(numericCast(n),a,y,iy)}
  public static func unpackM(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>) {vsUnpackM(numericCast(n),a,y,my)}
  public static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsCopy_32f(pSrc,pDst,numericCast(len))}
  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsMove_32f(pSrc,pDst,numericCast(len))}
  public static func set(_ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSet_32f(val,pDst,numericCast(len))}
  public static func zero(_ pDst:MutPtrT, _ len:Int) {_=ippsZero_32f(pDst,numericCast(len))}
  public static func triangle(_ pDst:MutPtrT, _ len:Int, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:MutPtrT) {_=ippsTriangle_32f(pDst,numericCast(len),magn,rFreq,asym,pPhase)}
  public static func vectorJaehne(_ pDst:MutPtrT, _ len:Int, _ magn:Element) {_=ippsVectorJaehne_32f(pDst,numericCast(len),magn)}
  public static func vectorSlope(_ pDst:MutPtrT, _ len:Int, _ offset:Element, _ slope:Element) {_=ippsVectorSlope_32f(pDst,numericCast(len),offset,slope)}
  public static func addC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsAddC_32f(pSrc,val,pDst,numericCast(len))}
  public static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int) {_=ippsAddProduct_32f(pSrc1,pSrc2,pSrcDst,numericCast(len))}
  public static func mulC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsMulC_32f(pSrc,val,pDst,numericCast(len))}
  public static func subC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSubC_32f(pSrc,val,pDst,numericCast(len))}
  public static func subCRev(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSubCRev_32f(pSrc,val,pDst,numericCast(len))}
  public static func divC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsDivC_32f(pSrc,val,pDst,numericCast(len))}
  public static func sumLn(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT) {_=ippsSumLn_32f(pSrc,numericCast(len),pSum)}
  public static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsArctan_32f(pSrc,pDst,numericCast(len))}
  public static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ vSub:Element, _ vDiv:Element) {_=ippsNormalize_32f(pSrc,pDst,numericCast(len),vSub,vDiv)}
  public static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsMagnitude_32f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsPhase_32f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsPowerSpectr_32f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LT_32f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_GT_32f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LTAbs_32f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_GTAbs_32f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_LTAbsVal_32f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_LTVal_32f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_GTVal_32f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element) {_=ippsThreshold_LTValGTVal_32f(pSrc,pDst,numericCast(len),levelLT,valueLT,levelGT,valueGT)}
  public static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LTInv_32f(pSrc,pDst,numericCast(len),level)}
  public static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int) {_=ippsCartToPolar_32f(pSrcRe,pSrcIm,pDstMagn,pDstPhase,numericCast(len))}
  public static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int) {_=ippsPolarToCart_32f(pSrcMagn,pSrcPhase,pDstRe,pDstIm,numericCast(len))}
  public static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsFlip_32f(pSrc,pDst,numericCast(len))}
  public static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBartlett_32f(pSrc,pDst,numericCast(len))}
  public static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinHann_32f(pSrc,pDst,numericCast(len))}
  public static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinHamming_32f(pSrc,pDst,numericCast(len))}
  public static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element) {_=ippsWinBlackman_32f(pSrc,pDst,numericCast(len),alpha)}
  public static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBlackmanStd_32f(pSrc,pDst,numericCast(len))}
  public static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBlackmanOpt_32f(pSrc,pDst,numericCast(len))}
  public static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element) {_=ippsWinKaiser_32f(pSrc,pDst,numericCast(len),alpha)}
  public static func sum(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT) {_=ippsSum_32f(pSrc,numericCast(len),pSum,ippAlgHintFast)}
  public static func min(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT) {_=ippsMin_32f(pSrc,numericCast(len),pMin)}
  public static func max(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT) {_=ippsMax_32f(pSrc,numericCast(len),pMax)}
  public static func minMax(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMax:MutPtrT) {_=ippsMinMax_32f(pSrc,numericCast(len),pMin,pMax)}
  public static func minAbs(_ pSrc:PtrT, _ len:Int, _ pMinAbs:MutPtrT) {_=ippsMinAbs_32f(pSrc,numericCast(len),pMinAbs)}
  public static func maxAbs(_ pSrc:PtrT, _ len:Int, _ pMaxAbs:MutPtrT) {_=ippsMaxAbs_32f(pSrc,numericCast(len),pMaxAbs)}
  public static func minIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {_=ippsMinIndx_32f(pSrc,numericCast(len),pMin,pIndx)}
  public static func maxIndx(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {_=ippsMaxIndx_32f(pSrc,numericCast(len),pMax,pIndx)}
  public static func minMaxIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>) {_=ippsMinMaxIndx_32f(pSrc,numericCast(len),pMin,pMinIndx,pMax,pMaxIndx)}
  public static func mean(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT) {_=ippsMean_32f(pSrc,numericCast(len),pMean,ippAlgHintFast)}
  public static func stdDev(_ pSrc:PtrT, _ len:Int, _ pStdDev:MutPtrT) {_=ippsStdDev_32f(pSrc,numericCast(len),pStdDev,ippAlgHintFast)}
  public static func meanStdDev(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT, _ pStdDev:MutPtrT) {_=ippsMeanStdDev_32f(pSrc,numericCast(len),pMean,pStdDev,ippAlgHintFast)}
  public static func norm_Inf(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_Inf_32f(pSrc,numericCast(len),pNorm)}
  public static func norm_L1(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_L1_32f(pSrc,numericCast(len),pNorm)}
  public static func norm_L2(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_L2_32f(pSrc,numericCast(len),pNorm)}
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_Inf_32f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_L1_32f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_L2_32f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pDp:MutPtrT) {_=ippsDotProd_32f(pSrc1,pSrc2,numericCast(len),pDp)}
  public static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {_=ippsMinEvery_32f(pSrc1,pSrc2,pDst,len)}
  public static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {_=ippsMaxEvery_32f(pSrc1,pSrc2,pDst,len)}
  public static func maxOrder(_ pSrc:PtrT, _ len:Int, _ pOrder:UnsafeMutablePointer<Int32>) {_=ippsMaxOrder_32f(pSrc,numericCast(len),pOrder)}
  public static func sampleUp(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {_=ippsSampleUp_32f(pSrc,numericCast(srcLen),pDst,pDstLen,numericCast(factor),pPhase)}
  public static func sampleDown(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {_=ippsSampleDown_32f(pSrc,numericCast(srcLen),pDst,pDstLen,numericCast(factor),pPhase)}
  public static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ maskSize:Int, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>) {_=ippsFilterMedian_32f(pSrc,pDst,numericCast(len),numericCast(maskSize),pDlySrc,pDlyDst,pBuffer)}
  public static func rngCauchy(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngCauchy(method,stream,numericCast(n),r,a,b)}
  public static func rngUniform(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngUniform(method,stream,numericCast(n),r,a,b)}
  public static func rngGaussian(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngGaussian(method,stream,numericCast(n),r,a,b)}
  public static func rngGaussianMV(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ dimen:Int, _ mstorage:Int32, _ a:PtrT, _ t:PtrT)->Int32 {return vsRngGaussianMV(method,stream,numericCast(n),r,numericCast(dimen),mstorage,a,t)}
  public static func rngExponential(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngExponential(method,stream,numericCast(n),r,a,b)}
  public static func rngLaplace(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngLaplace(method,stream,numericCast(n),r,a,b)}
  public static func rngWeibull(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return vsRngWeibull(method,stream,numericCast(n),r,a,b,c)}
  public static func rngRayleigh(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngRayleigh(method,stream,numericCast(n),r,a,b)}
  public static func rngLognormal(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return vsRngLognormal(method,stream,numericCast(n),r,a,b,c,d)}
  public static func rngGumbel(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vsRngGumbel(method,stream,numericCast(n),r,a,b)}
  public static func rngGamma(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return vsRngGamma(method,stream,numericCast(n),r,a,b,c)}
  public static func rngBeta(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return vsRngBeta(method,stream,numericCast(n),r,a,b,c,d)}

  public func acos() -> Float {return Foundation.acos(self)}
  public func acosh() -> Float {return Foundation.acosh(self)}
  public func asin() -> Float {return Foundation.asin(self)}
  public func asinh() -> Float {return Foundation.asinh(self)}
  public func atan() -> Float {return Foundation.atan(self)}
  public func atanh() -> Float {return Foundation.atanh(self)}
  public func cbrt() -> Float {return Foundation.cbrt(self)}
  public func cos() -> Float {return Foundation.cos(self)}
  public func cosh() -> Float {return Foundation.cosh(self)}
  public func erf() -> Float {return Foundation.erf(self)}
  public func erfc() -> Float {return Foundation.erfc(self)}
  public func exp() -> Float {return Foundation.exp(self)}
  public func exp2() -> Float {return Foundation.exp2(self)}
  public func expm1() -> Float {return Foundation.expm1(self)}
  public func log() -> Float {return Foundation.log(self)}
  public func log10() -> Float {return Foundation.log10(self)}
  public func log1p() -> Float {return Foundation.log1p(self)}
  public func log2() -> Float {return Foundation.log2(self)}
  public func logb() -> Float {return Foundation.logb(self)}
  public func nearbyint() -> Float {return Foundation.nearbyint(self)}
  public func rint() -> Float {return Foundation.rint(self)}
  public func sin() -> Float {return Foundation.sin(self)}
  public func sinh() -> Float {return Foundation.sinh(self)}
  public func tan() -> Float {return Foundation.tan(self)}
  public func tanh() -> Float {return Foundation.tanh(self)}
  public func tgamma() -> Float {return Foundation.tgamma(self)}

  public func pow(_ b: Float) -> Float {return Foundation.pow(self, b)}
  public func atan2(_ b: Float) -> Float {return Foundation.atan2(self, b)}
  public func copysign(_ b: Float) -> Float {return Foundation.copysign(self, b)}
  public func fdim(_ b: Float) -> Float {return Foundation.fdim(self, b)}
  public func fmax(_ b: Float) -> Float {return Foundation.fmax(self, b)}
  public func fmin(_ b: Float) -> Float {return Foundation.fmin(self, b)}
  public func hypot(_ b: Float) -> Float {return Foundation.hypot(self, b)}
  public func nextafter(_ b: Float) -> Float {return Foundation.nextafter(self, b)}
}
extension Double : SupportsMKL {
  public func min(_ b: Double) -> Double {return Swift.min(self, b)}
  public func max(_ b: Double) -> Double {return Swift.max(self, b)}

  public static func sum(_ pSrc:PtrT, _ len:Int) {smSum_double(pSrc,numericCast(len))}
  public static func dot(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int)->Element {return cblas_ddot(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func doti(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->Element {return cblas_ddoti(numericCast(N),X,indx,Y)}
  public static func nrm2(_ N:Int, _ X:PtrT, _ incX:Int)->Element {return cblas_dnrm2(numericCast(N),X,numericCast(incX))}
  public static func asum(_ N:Int, _ X:PtrT, _ incX:Int)->Element {return cblas_dasum(numericCast(N),X,numericCast(incX))}
  public static func swap(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_dswap(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func copy(_ N:Int, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_dcopy(numericCast(N),X,numericCast(incX),Y,numericCast(incY))}
  public static func axpy(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int) {cblas_daxpy(numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY))}
  public static func axpby(_ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_daxpby(numericCast(N),alpha,X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func axpyi(_ N:Int, _ alpha:Element, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {cblas_daxpyi(numericCast(N),alpha,X,indx,Y)}
  public static func gthr(_ N:Int, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {cblas_dgthr(numericCast(N),Y,X,indx)}
  public static func gthrz(_ N:Int, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) {cblas_dgthrz(numericCast(N),Y,X,indx)}
  public static func sctr(_ N:Int, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) {cblas_dsctr(numericCast(N),X,indx,Y)}
  public static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT) {cblas_drotg(a,b,c,s)}
  public static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:Element, _ P:MutPtrT) {cblas_drotmg(d1,d2,b1,b2,P)}
  public static func rot(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ c:Element, _ s:Element) {cblas_drot(numericCast(N),X,numericCast(incX),Y,numericCast(incY),c,s)}
  public static func roti(_ N:Int, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:Element, _ s:Element) {cblas_droti(numericCast(N),X,indx,Y,c,s)}
  public static func rotm(_ N:Int, _ X:MutPtrT, _ incX:Int, _ Y:MutPtrT, _ incY:Int, _ P:PtrT) {cblas_drotm(numericCast(N),X,numericCast(incX),Y,numericCast(incY),P)}
  public static func scal(_ N:Int, _ alpha:Element, _ X:MutPtrT, _ incX:Int) {cblas_dscal(numericCast(N),alpha,X,numericCast(incX))}
  public static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_dgemv(Layout,TransA,numericCast(M),numericCast(N),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ KL:Int, _ KU:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_dgbmv(Layout,TransA,numericCast(M),numericCast(N),numericCast(KL),numericCast(KU),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_dtrmv(Layout,Uplo,TransA,Diag,numericCast(N),A,numericCast(lda),X,numericCast(incX))}
  public static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_dtbmv(Layout,Uplo,TransA,Diag,numericCast(N),numericCast(K),A,numericCast(lda),X,numericCast(incX))}
  public static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {cblas_dtpmv(Layout,Uplo,TransA,Diag,numericCast(N),Ap,X,numericCast(incX))}
  public static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_dtrsv(Layout,Uplo,TransA,Diag,numericCast(N),A,numericCast(lda),X,numericCast(incX))}
  public static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ X:MutPtrT, _ incX:Int) {cblas_dtbsv(Layout,Uplo,TransA,Diag,numericCast(N),numericCast(K),A,numericCast(lda),X,numericCast(incX))}
  public static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int) {cblas_dtpsv(Layout,Uplo,TransA,Diag,numericCast(N),Ap,X,numericCast(incX))}
  public static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_dsymv(Layout,Uplo,numericCast(N),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_dsbmv(Layout,Uplo,numericCast(N),numericCast(K),alpha,A,numericCast(lda),X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ Ap:PtrT, _ X:PtrT, _ incX:Int, _ beta:Element, _ Y:MutPtrT, _ incY:Int) {cblas_dspmv(Layout,Uplo,numericCast(N),alpha,Ap,X,numericCast(incX),beta,Y,numericCast(incY))}
  public static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {cblas_dger(Layout,numericCast(M),numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A,numericCast(lda))}
  public static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ A:MutPtrT, _ lda:Int) {cblas_dsyr(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),A,numericCast(lda))}
  public static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Ap:MutPtrT) {cblas_dspr(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Ap)}
  public static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT, _ lda:Int) {cblas_dsyr2(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A,numericCast(lda))}
  public static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int, _ alpha:Element, _ X:PtrT, _ incX:Int, _ Y:PtrT, _ incY:Int, _ A:MutPtrT) {cblas_dspr2(Layout,Uplo,numericCast(N),alpha,X,numericCast(incX),Y,numericCast(incY),A)}
  public static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dgemm(Layout,TransA,TransB,numericCast(M),numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dgemmt(Layout,Uplo,TransA,TransB,numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dsymm(Layout,Side,Uplo,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dsyrk(Layout,Uplo,Trans,numericCast(N),numericCast(K),alpha,A,numericCast(lda),beta,C,numericCast(ldc))}
  public static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int, _ K:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dsyr2k(Layout,Uplo,Trans,numericCast(N),numericCast(K),alpha,A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {cblas_dtrmm(Layout,Side,Uplo,TransA,Diag,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb))}
  public static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int, _ N:Int, _ alpha:Element, _ A:PtrT, _ lda:Int, _ B:MutPtrT, _ ldb:Int) {cblas_dtrsm(Layout,Side,Uplo,TransA,Diag,numericCast(M),numericCast(N),alpha,A,numericCast(lda),B,numericCast(ldb))}
  public static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int, _ N:Int, _ K:Int)->Int32 {return cblas_dgemm_pack_get_size(identifier,numericCast(M),numericCast(N),numericCast(K))}
  public static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int, _ N:Int, _ K:Int, _ alpha:Element, _ src:PtrT, _ ld:Int, _ dest:MutPtrT) {cblas_dgemm_pack(Layout,identifier,Trans,numericCast(M),numericCast(N),numericCast(K),alpha,src,numericCast(ld),dest)}
  public static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int, _ TransB:Int, _ M:Int, _ N:Int, _ K:Int, _ A:PtrT, _ lda:Int, _ B:PtrT, _ ldb:Int, _ beta:Element, _ C:MutPtrT, _ ldc:Int) {cblas_dgemm_compute(Layout,numericCast(TransA),numericCast(TransB),numericCast(M),numericCast(N),numericCast(K),A,numericCast(lda),B,numericCast(ldb),beta,C,numericCast(ldc))}
  public static func gemm_free(_ dest:MutPtrT) {cblas_dgemm_free(dest)}
  public static func abs(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAbs(numericCast(n),a,r)}
  public static func add(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdAdd(numericCast(n),a,b,r)}
  public static func sub(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdSub(numericCast(n),a,b,r)}
  public static func inv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdInv(numericCast(n),a,r)}
  public static func sqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSqrt(numericCast(n),a,r)}
  public static func invSqrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdInvSqrt(numericCast(n),a,r)}
  public static func cbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCbrt(numericCast(n),a,r)}
  public static func invCbrt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdInvCbrt(numericCast(n),a,r)}
  public static func sqr(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSqr(numericCast(n),a,r)}
  public static func exp(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdExp(numericCast(n),a,r)}
  public static func exp2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdExp2(numericCast(n),a,r)}
  public static func exp10(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdExp10(numericCast(n),a,r)}
  public static func expm1(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdExpm1(numericCast(n),a,r)}
  public static func ln(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLn(numericCast(n),a,r)}
  public static func log2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLog2(numericCast(n),a,r)}
  public static func log10(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLog10(numericCast(n),a,r)}
  public static func log1p(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLog1p(numericCast(n),a,r)}
  public static func logb(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLogb(numericCast(n),a,r)}
  public static func cos(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCos(numericCast(n),a,r)}
  public static func sin(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSin(numericCast(n),a,r)}
  public static func tan(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTan(numericCast(n),a,r)}
  public static func cospi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCospi(numericCast(n),a,r)}
  public static func sinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSinpi(numericCast(n),a,r)}
  public static func tanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTanpi(numericCast(n),a,r)}
  public static func cosd(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCosd(numericCast(n),a,r)}
  public static func sind(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSind(numericCast(n),a,r)}
  public static func tand(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTand(numericCast(n),a,r)}
  public static func cosh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCosh(numericCast(n),a,r)}
  public static func sinh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdSinh(numericCast(n),a,r)}
  public static func tanh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTanh(numericCast(n),a,r)}
  public static func acos(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAcos(numericCast(n),a,r)}
  public static func asin(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAsin(numericCast(n),a,r)}
  public static func atan(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAtan(numericCast(n),a,r)}
  public static func acospi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAcospi(numericCast(n),a,r)}
  public static func asinpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAsinpi(numericCast(n),a,r)}
  public static func atanpi(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAtanpi(numericCast(n),a,r)}
  public static func acosh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAcosh(numericCast(n),a,r)}
  public static func asinh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAsinh(numericCast(n),a,r)}
  public static func atanh(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdAtanh(numericCast(n),a,r)}
  public static func erf(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdErf(numericCast(n),a,r)}
  public static func erfInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdErfInv(numericCast(n),a,r)}
  public static func hypot(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdHypot(numericCast(n),a,b,r)}
  public static func erfc(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdErfc(numericCast(n),a,r)}
  public static func erfcInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdErfcInv(numericCast(n),a,r)}
  public static func cdfNorm(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCdfNorm(numericCast(n),a,r)}
  public static func cdfNormInv(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCdfNormInv(numericCast(n),a,r)}
  public static func lGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdLGamma(numericCast(n),a,r)}
  public static func tGamma(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTGamma(numericCast(n),a,r)}
  public static func atan2(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdAtan2(numericCast(n),a,b,r)}
  public static func atan2pi(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdAtan2pi(numericCast(n),a,b,r)}
  public static func mul(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdMul(numericCast(n),a,b,r)}
  public static func div(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdDiv(numericCast(n),a,b,r)}
  public static func pow(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdPow(numericCast(n),a,b,r)}
  public static func pow3o2(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdPow3o2(numericCast(n),a,r)}
  public static func pow2o3(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdPow2o3(numericCast(n),a,r)}
  public static func powx(_ n:Int, _ a:PtrT, _ b:Element, _ r:MutPtrT) {vdPowx(numericCast(n),a,b,r)}
  public static func powr(_ n:Int, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) {vdPowr(numericCast(n),a,b,r)}
  public static func sinCos(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdSinCos(numericCast(n),a,r1,r2)}
  public static func linearFrac(_ n:Int, _ a:PtrT, _ b:PtrT, _ scalea:Element, _ shifta:Element, _ scaleb:Element, _ shiftb:Element, _ r:MutPtrT) {vdLinearFrac(numericCast(n),a,b,scalea,shifta,scaleb,shiftb,r)}
  public static func ceil(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdCeil(numericCast(n),a,r)}
  public static func floor(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdFloor(numericCast(n),a,r)}
  public static func frac(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdFrac(numericCast(n),a,r)}
  public static func modf(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdModf(numericCast(n),a,r1,r2)}
  public static func fmod(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdFmod(numericCast(n),a,r1,r2)}
  public static func remainder(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdRemainder(numericCast(n),a,r1,r2)}
  public static func nextAfter(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdNextAfter(numericCast(n),a,r1,r2)}
  public static func copySign(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdCopySign(numericCast(n),a,r1,r2)}
  public static func fdim(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdFdim(numericCast(n),a,r1,r2)}
  public static func fmax(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdFmax(numericCast(n),a,r1,r2)}
  public static func fmin(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdFmin(numericCast(n),a,r1,r2)}
  public static func maxMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdMaxMag(numericCast(n),a,r1,r2)}
  public static func minMag(_ n:Int, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) {vdMinMag(numericCast(n),a,r1,r2)}
  public static func nearbyInt(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdNearbyInt(numericCast(n),a,r)}
  public static func rint(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdRint(numericCast(n),a,r)}
  public static func round(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdRound(numericCast(n),a,r)}
  public static func trunc(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdTrunc(numericCast(n),a,r)}
  public static func expInt1(_ n:Int, _ a:PtrT, _ r:MutPtrT) {vdExpInt1(numericCast(n),a,r)}
  public static func packI(_ n:Int, _ a:PtrT, _ incra:Int, _ y:MutPtrT) {vdPackI(numericCast(n),a,numericCast(incra),y)}
  public static func packV(_ n:Int, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) {vdPackV(numericCast(n),a,ia,y)}
  public static func packM(_ n:Int, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) {vdPackM(numericCast(n),a,ma,y)}
  public static func unpackI(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ incry:Int) {vdUnpackI(numericCast(n),a,y,numericCast(incry))}
  public static func unpackV(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>) {vdUnpackV(numericCast(n),a,y,iy)}
  public static func unpackM(_ n:Int, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>) {vdUnpackM(numericCast(n),a,y,my)}
  public static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsCopy_64f(pSrc,pDst,numericCast(len))}
  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsMove_64f(pSrc,pDst,numericCast(len))}
  public static func set(_ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSet_64f(val,pDst,numericCast(len))}
  public static func zero(_ pDst:MutPtrT, _ len:Int) {_=ippsZero_64f(pDst,numericCast(len))}
  public static func triangle(_ pDst:MutPtrT, _ len:Int, _ magn:Element, _ rFreq:Element, _ asym:Element, _ pPhase:MutPtrT) {_=ippsTriangle_64f(pDst,numericCast(len),magn,rFreq,asym,pPhase)}
  public static func vectorJaehne(_ pDst:MutPtrT, _ len:Int, _ magn:Element) {_=ippsVectorJaehne_64f(pDst,numericCast(len),magn)}
  public static func vectorSlope(_ pDst:MutPtrT, _ len:Int, _ offset:Element, _ slope:Element) {_=ippsVectorSlope_64f(pDst,numericCast(len),offset,slope)}
  public static func addC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsAddC_64f(pSrc,val,pDst,numericCast(len))}
  public static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int) {_=ippsAddProduct_64f(pSrc1,pSrc2,pSrcDst,numericCast(len))}
  public static func mulC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsMulC_64f(pSrc,val,pDst,numericCast(len))}
  public static func subC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSubC_64f(pSrc,val,pDst,numericCast(len))}
  public static func subCRev(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsSubCRev_64f(pSrc,val,pDst,numericCast(len))}
  public static func divC(_ pSrc:PtrT, _ val:Element, _ pDst:MutPtrT, _ len:Int) {_=ippsDivC_64f(pSrc,val,pDst,numericCast(len))}
  public static func sumLn(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT) {_=ippsSumLn_64f(pSrc,numericCast(len),pSum)}
  public static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsArctan_64f(pSrc,pDst,numericCast(len))}
  public static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ vSub:Element, _ vDiv:Element) {_=ippsNormalize_64f(pSrc,pDst,numericCast(len),vSub,vDiv)}
  public static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsMagnitude_64f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsPhase_64f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsPowerSpectr_64f(pSrcRe,pSrcIm,pDst,numericCast(len))}
  public static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LT_64f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_GT_64f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LTAbs_64f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_GTAbs_64f(pSrc,pDst,numericCast(len),level)}
  public static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_LTAbsVal_64f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_LTVal_64f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element, _ value:Element) {_=ippsThreshold_GTVal_64f(pSrc,pDst,numericCast(len),level,value)}
  public static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ levelLT:Element, _ valueLT:Element, _ levelGT:Element, _ valueGT:Element) {_=ippsThreshold_LTValGTVal_64f(pSrc,pDst,numericCast(len),levelLT,valueLT,levelGT,valueGT)}
  public static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ level:Element) {_=ippsThreshold_LTInv_64f(pSrc,pDst,numericCast(len),level)}
  public static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int) {_=ippsCartToPolar_64f(pSrcRe,pSrcIm,pDstMagn,pDstPhase,numericCast(len))}
  public static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int) {_=ippsPolarToCart_64f(pSrcMagn,pSrcPhase,pDstRe,pDstIm,numericCast(len))}
  public static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsFlip_64f(pSrc,pDst,numericCast(len))}
  public static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBartlett_64f(pSrc,pDst,numericCast(len))}
  public static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinHann_64f(pSrc,pDst,numericCast(len))}
  public static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinHamming_64f(pSrc,pDst,numericCast(len))}
  public static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element) {_=ippsWinBlackman_64f(pSrc,pDst,numericCast(len),alpha)}
  public static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBlackmanStd_64f(pSrc,pDst,numericCast(len))}
  public static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int) {_=ippsWinBlackmanOpt_64f(pSrc,pDst,numericCast(len))}
  public static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ alpha:Element) {_=ippsWinKaiser_64f(pSrc,pDst,numericCast(len),alpha)}
  public static func sum(_ pSrc:PtrT, _ len:Int, _ pSum:MutPtrT) {_=ippsSum_64f(pSrc,numericCast(len),pSum)}
  public static func min(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT) {_=ippsMin_64f(pSrc,numericCast(len),pMin)}
  public static func max(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT) {_=ippsMax_64f(pSrc,numericCast(len),pMax)}
  public static func minMax(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMax:MutPtrT) {_=ippsMinMax_64f(pSrc,numericCast(len),pMin,pMax)}
  public static func minAbs(_ pSrc:PtrT, _ len:Int, _ pMinAbs:MutPtrT) {_=ippsMinAbs_64f(pSrc,numericCast(len),pMinAbs)}
  public static func maxAbs(_ pSrc:PtrT, _ len:Int, _ pMaxAbs:MutPtrT) {_=ippsMaxAbs_64f(pSrc,numericCast(len),pMaxAbs)}
  public static func minIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {_=ippsMinIndx_64f(pSrc,numericCast(len),pMin,pIndx)}
  public static func maxIndx(_ pSrc:PtrT, _ len:Int, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) {_=ippsMaxIndx_64f(pSrc,numericCast(len),pMax,pIndx)}
  public static func minMaxIndx(_ pSrc:PtrT, _ len:Int, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>) {_=ippsMinMaxIndx_64f(pSrc,numericCast(len),pMin,pMinIndx,pMax,pMaxIndx)}
  public static func mean(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT) {_=ippsMean_64f(pSrc,numericCast(len),pMean)}
  public static func stdDev(_ pSrc:PtrT, _ len:Int, _ pStdDev:MutPtrT) {_=ippsStdDev_64f(pSrc,numericCast(len),pStdDev)}
  public static func meanStdDev(_ pSrc:PtrT, _ len:Int, _ pMean:MutPtrT, _ pStdDev:MutPtrT) {_=ippsMeanStdDev_64f(pSrc,numericCast(len),pMean,pStdDev)}
  public static func norm_Inf(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_Inf_64f(pSrc,numericCast(len),pNorm)}
  public static func norm_L1(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_L1_64f(pSrc,numericCast(len),pNorm)}
  public static func norm_L2(_ pSrc:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNorm_L2_64f(pSrc,numericCast(len),pNorm)}
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_Inf_64f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_L1_64f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pNorm:MutPtrT) {_=ippsNormDiff_L2_64f(pSrc1,pSrc2,numericCast(len),pNorm)}
  public static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int, _ pDp:MutPtrT) {_=ippsDotProd_64f(pSrc1,pSrc2,numericCast(len),pDp)}
  public static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {_=ippsMinEvery_64f(pSrc1,pSrc2,pDst,len)}
  public static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) {_=ippsMaxEvery_64f(pSrc1,pSrc2,pDst,len)}
  public static func maxOrder(_ pSrc:PtrT, _ len:Int, _ pOrder:UnsafeMutablePointer<Int32>) {_=ippsMaxOrder_64f(pSrc,numericCast(len),pOrder)}
  public static func sampleUp(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {_=ippsSampleUp_64f(pSrc,numericCast(srcLen),pDst,pDstLen,numericCast(factor),pPhase)}
  public static func sampleDown(_ pSrc:PtrT, _ srcLen:Int, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int, _ pPhase:UnsafeMutablePointer<Int32>) {_=ippsSampleDown_64f(pSrc,numericCast(srcLen),pDst,pDstLen,numericCast(factor),pPhase)}
  public static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int, _ maskSize:Int, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>) {_=ippsFilterMedian_64f(pSrc,pDst,numericCast(len),numericCast(maskSize),pDlySrc,pDlyDst,pBuffer)}
  public static func rngCauchy(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngCauchy(method,stream,numericCast(n),r,a,b)}
  public static func rngUniform(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngUniform(method,stream,numericCast(n),r,a,b)}
  public static func rngGaussian(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngGaussian(method,stream,numericCast(n),r,a,b)}
  public static func rngGaussianMV(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ dimen:Int, _ mstorage:Int32, _ a:PtrT, _ t:PtrT)->Int32 {return vdRngGaussianMV(method,stream,numericCast(n),r,numericCast(dimen),mstorage,a,t)}
  public static func rngExponential(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngExponential(method,stream,numericCast(n),r,a,b)}
  public static func rngLaplace(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngLaplace(method,stream,numericCast(n),r,a,b)}
  public static func rngWeibull(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return vdRngWeibull(method,stream,numericCast(n),r,a,b,c)}
  public static func rngRayleigh(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngRayleigh(method,stream,numericCast(n),r,a,b)}
  public static func rngLognormal(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return vdRngLognormal(method,stream,numericCast(n),r,a,b,c,d)}
  public static func rngGumbel(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element)->Int32 {return vdRngGumbel(method,stream,numericCast(n),r,a,b)}
  public static func rngGamma(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element)->Int32 {return vdRngGamma(method,stream,numericCast(n),r,a,b,c)}
  public static func rngBeta(_ method:Int32, _ stream:VSLStreamStatePtr, _ n:Int, _ r:MutPtrT, _ a:Element, _ b:Element, _ c:Element, _ d:Element)->Int32 {return vdRngBeta(method,stream,numericCast(n),r,a,b,c,d)}

  public func acos() -> Double {return Foundation.acos(self)}
  public func acosh() -> Double {return Foundation.acosh(self)}
  public func asin() -> Double {return Foundation.asin(self)}
  public func asinh() -> Double {return Foundation.asinh(self)}
  public func atan() -> Double {return Foundation.atan(self)}
  public func atanh() -> Double {return Foundation.atanh(self)}
  public func cbrt() -> Double {return Foundation.cbrt(self)}
  public func cos() -> Double {return Foundation.cos(self)}
  public func cosh() -> Double {return Foundation.cosh(self)}
  public func erf() -> Double {return Foundation.erf(self)}
  public func erfc() -> Double {return Foundation.erfc(self)}
  public func exp() -> Double {return Foundation.exp(self)}
  public func exp2() -> Double {return Foundation.exp2(self)}
  public func expm1() -> Double {return Foundation.expm1(self)}
  public func log() -> Double {return Foundation.log(self)}
  public func log10() -> Double {return Foundation.log10(self)}
  public func log1p() -> Double {return Foundation.log1p(self)}
  public func log2() -> Double {return Foundation.log2(self)}
  public func logb() -> Double {return Foundation.logb(self)}
  public func nearbyint() -> Double {return Foundation.nearbyint(self)}
  public func rint() -> Double {return Foundation.rint(self)}
  public func sin() -> Double {return Foundation.sin(self)}
  public func sinh() -> Double {return Foundation.sinh(self)}
  public func tan() -> Double {return Foundation.tan(self)}
  public func tanh() -> Double {return Foundation.tanh(self)}
  public func tgamma() -> Double {return Foundation.tgamma(self)}

  public func pow(_ b: Double) -> Double {return Foundation.pow(self, b)}
  public func atan2(_ b: Double) -> Double {return Foundation.atan2(self, b)}
  public func copysign(_ b: Double) -> Double {return Foundation.copysign(self, b)}
  public func fdim(_ b: Double) -> Double {return Foundation.fdim(self, b)}
  public func fmax(_ b: Double) -> Double {return Foundation.fmax(self, b)}
  public func fmin(_ b: Double) -> Double {return Foundation.fmin(self, b)}
  public func hypot(_ b: Double) -> Double {return Foundation.hypot(self, b)}
  public func nextafter(_ b: Double) -> Double {return Foundation.nextafter(self, b)}
}

precedencegroup ExponentiationPrecedence { associativity: right higherThan: MultiplicationPrecedence }
infix operator ^^: ExponentiationPrecedence

public func ^^<Element:SupportsMKL> (x:Element, a:Element) -> Element { return x.pow(a) }

