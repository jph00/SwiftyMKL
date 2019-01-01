import Foundation
import CMKL
import CIPP



public protocol SupportsMKL:BinaryFloatingPoint {
  typealias T=Self
  typealias PtrT = UnsafePointer<T>
  typealias MutPtrT = UnsafeMutablePointer<T>

  init(_ value: CGFloat)
  init(_ value: Self)
  init()
  var cgfloat : CGFloat {get}
  func pow(_ b: Self) -> Self
  func min(_ b: Self) -> Self
  func max(_ b: Self) -> Self
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
  func j0() -> Self
  func j1() -> Self
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
  func y0() -> Self
  func y1() -> Self

  static func dot(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32)->T
  static func doti(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->T
  static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T
  static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T
  static func swap(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32)
  static func copy(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32)
  static func axpy(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32)
  static func axpby(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func axpyi(_ N:Int32, _ alpha:T, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT)
  static func gthr(_ N:Int32, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>)
  static func gthrz(_ N:Int32, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>)
  static func sctr(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT)
  static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT)
  static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:T, _ P:MutPtrT)
  static func rot(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ c:T, _ s:T)
  static func roti(_ N:Int32, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:T, _ s:T)
  static func rotm(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ P:PtrT)
  static func scal(_ N:Int32, _ alpha:T, _ X:MutPtrT, _ incX:Int32)
  static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ KL:Int32, _ KU:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32)
  static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32)
  static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32)
  static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32)
  static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32)
  static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32)
  static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ Ap:PtrT, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32)
  static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int32, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32)
  static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ A:MutPtrT, _ lda:Int32)
  static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Ap:MutPtrT)
  static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32)
  static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT)
  static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32)
  static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32)
  static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int32, _ N:Int32, _ K:Int32)->Int32
  static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ src:PtrT, _ ld:Int32, _ dest:MutPtrT)
  static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int32, _ TransB:Int32, _ M:Int32, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32)
  static func gemm_free(_ dest:MutPtrT)

  static func abs(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func add(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func sub(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func inv(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func invSqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func invCbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sqr(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func exp(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func exp2(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func exp10(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func log2(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func logb(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cosd(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sind(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tand(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func acospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func asinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func erfcInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cdfNorm(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cdfNormInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func lGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func atan2pi(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT)
  static func powr(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func sinCos(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func linearFrac(_ n:Int32, _ a:PtrT, _ b:PtrT, _ scalea:T, _ shifta:T, _ scaleb:T, _ shiftb:T, _ r:MutPtrT)
  static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func frac(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func modf(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmod(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func remainder(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func nextAfter(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func copySign(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fdim(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmax(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func fmin(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func maxMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func minMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT)
  static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func expInt1(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT)
  static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT)
  static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT)
  static func unpackI(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ incry:Int32)
  static func unpackV(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>)
  static func unpackM(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>)

  static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func zero(_ pDst:MutPtrT, _ len:Int32)
  static func triangle(_ pDst:MutPtrT, _ len:Int32, _ magn:T, _ rFreq:T, _ asym:T, _ pPhase:MutPtrT)
  static func vectorJaehne(_ pDst:MutPtrT, _ len:Int32, _ magn:T)
  static func vectorSlope(_ pDst:MutPtrT, _ len:Int32, _ offset:T, _ slope:T)
  static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func add(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func addProductC(_ pSrc:PtrT, _ val:T, _ pSrcDst:MutPtrT, _ len:Int32)
  static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int32)
  static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func mul(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func subCRev(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func sub(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func div(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func abs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func sqr(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func sqrt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func exp(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func ln(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func sumLn(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT)
  static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ vSub:T, _ vDiv:T)
  static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T)
  static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T)
  static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T)
  static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T)
  static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T)
  static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T)
  static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T)
  static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ levelLT:T, _ valueLT:T, _ levelGT:T, _ valueGT:T)
  static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T)
  static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int32)
  static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int32)
  static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T)
  static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T)
  static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT)
  static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT)
  static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT)
  static func minMax(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMax:MutPtrT)
  static func minAbs(_ pSrc:PtrT, _ len:Int32, _ pMinAbs:MutPtrT)
  static func maxAbs(_ pSrc:PtrT, _ len:Int32, _ pMaxAbs:MutPtrT)
  static func minIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>)
  static func maxIndx(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>)
  static func minMaxIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>)
  static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT)
  static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT)
  static func meanStdDev(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT, _ pStdDev:MutPtrT)
  static func norm_Inf(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func norm_L1(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func norm_L2(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pDp:MutPtrT)
  static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32)
  static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32)
  static func maxOrder(_ pSrc:PtrT, _ len:Int32, _ pOrder:UnsafeMutablePointer<Int32>)
  static func sampleUp(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>)
  static func sampleDown(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>)
  static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ maskSize:Int32, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>)
  static func floor(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func ceil(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func trunc(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func round(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func rint(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func nearbyInt(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
  static func modf(_ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT, _ n:Int32)
  static func frac(_ a:PtrT, _ r:MutPtrT, _ n:Int32)
}

extension Float : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }

  public func pow(_ b: Float) -> Float {return Foundation.pow(self, b)}
  public func min(_ b: Float) -> Float {return Swift.min(self, b)}
  public func max(_ b: Float) -> Float {return Swift.max(self, b)}

  public static func dot(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32)->T { return cblas_sdot(N,X,incX,Y,incY) }
  public static func doti(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->T { return cblas_sdoti(N,X,indx,Y) }
  public static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_snrm2(N,X,incX) }
  public static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_sasum(N,X,incX) }
  public static func swap(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_sswap(N,X,incX,Y,incY) }
  public static func copy(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_scopy(N,X,incX,Y,incY) }
  public static func axpy(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_saxpy(N,alpha,X,incX,Y,incY) }
  public static func axpby(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_saxpby(N,alpha,X,incX,beta,Y,incY) }
  public static func axpyi(_ N:Int32, _ alpha:T, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) { cblas_saxpyi(N,alpha,X,indx,Y) }
  public static func gthr(_ N:Int32, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) { cblas_sgthr(N,Y,X,indx) }
  public static func gthrz(_ N:Int32, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) { cblas_sgthrz(N,Y,X,indx) }
  public static func sctr(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) { cblas_ssctr(N,X,indx,Y) }
  public static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT) { cblas_srotg(a,b,c,s) }
  public static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:T, _ P:MutPtrT) { cblas_srotmg(d1,d2,b1,b2,P) }
  public static func rot(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ c:T, _ s:T) { cblas_srot(N,X,incX,Y,incY,c,s) }
  public static func roti(_ N:Int32, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:T, _ s:T) { cblas_sroti(N,X,indx,Y,c,s) }
  public static func rotm(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ P:PtrT) { cblas_srotm(N,X,incX,Y,incY,P) }
  public static func scal(_ N:Int32, _ alpha:T, _ X:MutPtrT, _ incX:Int32) { cblas_sscal(N,alpha,X,incX) }
  public static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_sgemv(Layout,TransA,M,N,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ KL:Int32, _ KU:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_sgbmv(Layout,TransA,M,N,KL,KU,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_strmv(Layout,Uplo,TransA,Diag,N,A,lda,X,incX) }
  public static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_stbmv(Layout,Uplo,TransA,Diag,N,K,A,lda,X,incX) }
  public static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32) { cblas_stpmv(Layout,Uplo,TransA,Diag,N,Ap,X,incX) }
  public static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_strsv(Layout,Uplo,TransA,Diag,N,A,lda,X,incX) }
  public static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_stbsv(Layout,Uplo,TransA,Diag,N,K,A,lda,X,incX) }
  public static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32) { cblas_stpsv(Layout,Uplo,TransA,Diag,N,Ap,X,incX) }
  public static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_ssymv(Layout,Uplo,N,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_ssbmv(Layout,Uplo,N,K,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ Ap:PtrT, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_sspmv(Layout,Uplo,N,alpha,Ap,X,incX,beta,Y,incY) }
  public static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int32, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_sger(Layout,M,N,alpha,X,incX,Y,incY,A,lda) }
  public static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_ssyr(Layout,Uplo,N,alpha,X,incX,A,lda) }
  public static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Ap:MutPtrT) { cblas_sspr(Layout,Uplo,N,alpha,X,incX,Ap) }
  public static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_ssyr2(Layout,Uplo,N,alpha,X,incX,Y,incY,A,lda) }
  public static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT) { cblas_sspr2(Layout,Uplo,N,alpha,X,incX,Y,incY,A) }
  public static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_sgemm(Layout,TransA,TransB,M,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_sgemmt(Layout,Uplo,TransA,TransB,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_ssymm(Layout,Side,Uplo,M,N,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_ssyrk(Layout,Uplo,Trans,N,K,alpha,A,lda,beta,C,ldc) }
  public static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_ssyr2k(Layout,Uplo,Trans,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32) { cblas_strmm(Layout,Side,Uplo,TransA,Diag,M,N,alpha,A,lda,B,ldb) }
  public static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32) { cblas_strsm(Layout,Side,Uplo,TransA,Diag,M,N,alpha,A,lda,B,ldb) }
  public static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int32, _ N:Int32, _ K:Int32)->Int32 { return cblas_sgemm_pack_get_size(identifier,M,N,K) }
  public static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ src:PtrT, _ ld:Int32, _ dest:MutPtrT) { cblas_sgemm_pack(Layout,identifier,Trans,M,N,K,alpha,src,ld,dest) }
  public static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int32, _ TransB:Int32, _ M:Int32, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_sgemm_compute(Layout,TransA,TransB,M,N,K,A,lda,B,ldb,beta,C,ldc) }
  public static func gemm_free(_ dest:MutPtrT) { cblas_sgemm_free(dest) }

  public static func abs(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAbs(n,a,r) }
  public static func add(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsAdd(n,a,b,r) }
  public static func sub(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsSub(n,a,b,r) }
  public static func inv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsInv(n,a,r) }
  public static func sqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSqrt(n,a,r) }
  public static func invSqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsInvSqrt(n,a,r) }
  public static func cbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCbrt(n,a,r) }
  public static func invCbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsInvCbrt(n,a,r) }
  public static func sqr(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSqr(n,a,r) }
  public static func exp(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExp(n,a,r) }
  public static func exp2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExp2(n,a,r) }
  public static func exp10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExp10(n,a,r) }
  public static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExpm1(n,a,r) }
  public static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLn(n,a,r) }
  public static func log2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLog2(n,a,r) }
  public static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLog10(n,a,r) }
  public static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLog1p(n,a,r) }
  public static func logb(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLogb(n,a,r) }
  public static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCos(n,a,r) }
  public static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSin(n,a,r) }
  public static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTan(n,a,r) }
  public static func cospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCospi(n,a,r) }
  public static func sinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSinpi(n,a,r) }
  public static func tanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTanpi(n,a,r) }
  public static func cosd(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCosd(n,a,r) }
  public static func sind(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSind(n,a,r) }
  public static func tand(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTand(n,a,r) }
  public static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCosh(n,a,r) }
  public static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSinh(n,a,r) }
  public static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTanh(n,a,r) }
  public static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAcos(n,a,r) }
  public static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAsin(n,a,r) }
  public static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAtan(n,a,r) }
  public static func acospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAcospi(n,a,r) }
  public static func asinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAsinpi(n,a,r) }
  public static func atanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAtanpi(n,a,r) }
  public static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAcosh(n,a,r) }
  public static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAsinh(n,a,r) }
  public static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAtanh(n,a,r) }
  public static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErf(n,a,r) }
  public static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErfInv(n,a,r) }
  public static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsHypot(n,a,b,r) }
  public static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErfc(n,a,r) }
  public static func erfcInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErfcInv(n,a,r) }
  public static func cdfNorm(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCdfNorm(n,a,r) }
  public static func cdfNormInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCdfNormInv(n,a,r) }
  public static func lGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLGamma(n,a,r) }
  public static func tGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTGamma(n,a,r) }
  public static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsAtan2(n,a,b,r) }
  public static func atan2pi(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsAtan2pi(n,a,b,r) }
  public static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsMul(n,a,b,r) }
  public static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsDiv(n,a,b,r) }
  public static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsPow(n,a,b,r) }
  public static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsPow3o2(n,a,r) }
  public static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsPow2o3(n,a,r) }
  public static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT) { vsPowx(n,a,b,r) }
  public static func powr(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsPowr(n,a,b,r) }
  public static func sinCos(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsSinCos(n,a,r1,r2) }
  public static func linearFrac(_ n:Int32, _ a:PtrT, _ b:PtrT, _ scalea:T, _ shifta:T, _ scaleb:T, _ shiftb:T, _ r:MutPtrT) { vsLinearFrac(n,a,b,scalea,shifta,scaleb,shiftb,r) }
  public static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCeil(n,a,r) }
  public static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsFloor(n,a,r) }
  public static func frac(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsFrac(n,a,r) }
  public static func modf(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsModf(n,a,r1,r2) }
  public static func fmod(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsFmod(n,a,r1,r2) }
  public static func remainder(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsRemainder(n,a,r1,r2) }
  public static func nextAfter(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsNextAfter(n,a,r1,r2) }
  public static func copySign(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsCopySign(n,a,r1,r2) }
  public static func fdim(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsFdim(n,a,r1,r2) }
  public static func fmax(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsFmax(n,a,r1,r2) }
  public static func fmin(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsFmin(n,a,r1,r2) }
  public static func maxMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsMaxMag(n,a,r1,r2) }
  public static func minMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vsMinMag(n,a,r1,r2) }
  public static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsNearbyInt(n,a,r) }
  public static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsRint(n,a,r) }
  public static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsRound(n,a,r) }
  public static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTrunc(n,a,r) }
  public static func expInt1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExpInt1(n,a,r) }
  public static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT) { vsPackI(n,a,incra,y) }
  public static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) { vsPackV(n,a,ia,y) }
  public static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) { vsPackM(n,a,ma,y) }
  public static func unpackI(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ incry:Int32) { vsUnpackI(n,a,y,incry) }
  public static func unpackV(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>) { vsUnpackV(n,a,y,iy) }
  public static func unpackM(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>) { vsUnpackM(n,a,y,my) }

  public static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsCopy_32f(pSrc,pDst,len) }
  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMove_32f(pSrc,pDst,len) }
  public static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSet_32f(val,pDst,len) }
  public static func zero(_ pDst:MutPtrT, _ len:Int32) { _=ippsZero_32f(pDst,len) }
  public static func triangle(_ pDst:MutPtrT, _ len:Int32, _ magn:T, _ rFreq:T, _ asym:T, _ pPhase:MutPtrT) { _=ippsTriangle_32f(pDst,len,magn,rFreq,asym,pPhase) }
  public static func vectorJaehne(_ pDst:MutPtrT, _ len:Int32, _ magn:T) { _=ippsVectorJaehne_32f(pDst,len,magn) }
  public static func vectorSlope(_ pDst:MutPtrT, _ len:Int32, _ offset:T, _ slope:T) { _=ippsVectorSlope_32f(pDst,len,offset,slope) }
  public static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsAddC_32f(pSrc,val,pDst,len) }
  public static func add(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsAdd_32f(pSrc1,pSrc2,pDst,len) }
  public static func addProductC(_ pSrc:PtrT, _ val:T, _ pSrcDst:MutPtrT, _ len:Int32) { _=ippsAddProductC_32f(pSrc,val,pSrcDst,len) }
  public static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int32) { _=ippsAddProduct_32f(pSrc1,pSrc2,pSrcDst,len) }
  public static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsMulC_32f(pSrc,val,pDst,len) }
  public static func mul(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMul_32f(pSrc1,pSrc2,pDst,len) }
  public static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubC_32f(pSrc,val,pDst,len) }
  public static func subCRev(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubCRev_32f(pSrc,val,pDst,len) }
  public static func sub(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSub_32f(pSrc1,pSrc2,pDst,len) }
  public static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsDivC_32f(pSrc,val,pDst,len) }
  public static func div(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsDiv_32f(pSrc1,pSrc2,pDst,len) }
  public static func abs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsAbs_32f(pSrc,pDst,len) }
  public static func sqr(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSqr_32f(pSrc,pDst,len) }
  public static func sqrt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSqrt_32f(pSrc,pDst,len) }
  public static func exp(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsExp_32f(pSrc,pDst,len) }
  public static func ln(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsLn_32f(pSrc,pDst,len) }
  public static func sumLn(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSumLn_32f(pSrc,len,pSum) }
  public static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsArctan_32f(pSrc,pDst,len) }
  public static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ vSub:T, _ vDiv:T) { _=ippsNormalize_32f(pSrc,pDst,len,vSub,vDiv) }
  public static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMagnitude_32f(pSrcRe,pSrcIm,pDst,len) }
  public static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsPhase_32f(pSrcRe,pSrcIm,pDst,len) }
  public static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsPowerSpectr_32f(pSrcRe,pSrcIm,pDst,len) }
  public static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LT_32f(pSrc,pDst,len,level) }
  public static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_GT_32f(pSrc,pDst,len,level) }
  public static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LTAbs_32f(pSrc,pDst,len,level) }
  public static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_GTAbs_32f(pSrc,pDst,len,level) }
  public static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_LTAbsVal_32f(pSrc,pDst,len,level,value) }
  public static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_LTVal_32f(pSrc,pDst,len,level,value) }
  public static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_GTVal_32f(pSrc,pDst,len,level,value) }
  public static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ levelLT:T, _ valueLT:T, _ levelGT:T, _ valueGT:T) { _=ippsThreshold_LTValGTVal_32f(pSrc,pDst,len,levelLT,valueLT,levelGT,valueGT) }
  public static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LTInv_32f(pSrc,pDst,len,level) }
  public static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int32) { _=ippsCartToPolar_32f(pSrcRe,pSrcIm,pDstMagn,pDstPhase,len) }
  public static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int32) { _=ippsPolarToCart_32f(pSrcMagn,pSrcPhase,pDstRe,pDstIm,len) }
  public static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsFlip_32f(pSrc,pDst,len) }
  public static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBartlett_32f(pSrc,pDst,len) }
  public static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinHann_32f(pSrc,pDst,len) }
  public static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinHamming_32f(pSrc,pDst,len) }
  public static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T) { _=ippsWinBlackman_32f(pSrc,pDst,len,alpha) }
  public static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBlackmanStd_32f(pSrc,pDst,len) }
  public static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBlackmanOpt_32f(pSrc,pDst,len) }
  public static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T) { _=ippsWinKaiser_32f(pSrc,pDst,len,alpha) }
  public static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSum_32f(pSrc,len,pSum,ippAlgHintFast) }
  public static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT) { _=ippsMin_32f(pSrc,len,pMin) }
  public static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT) { _=ippsMax_32f(pSrc,len,pMax) }
  public static func minMax(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMax:MutPtrT) { _=ippsMinMax_32f(pSrc,len,pMin,pMax) }
  public static func minAbs(_ pSrc:PtrT, _ len:Int32, _ pMinAbs:MutPtrT) { _=ippsMinAbs_32f(pSrc,len,pMinAbs) }
  public static func maxAbs(_ pSrc:PtrT, _ len:Int32, _ pMaxAbs:MutPtrT) { _=ippsMaxAbs_32f(pSrc,len,pMaxAbs) }
  public static func minIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) { _=ippsMinIndx_32f(pSrc,len,pMin,pIndx) }
  public static func maxIndx(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) { _=ippsMaxIndx_32f(pSrc,len,pMax,pIndx) }
  public static func minMaxIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>) { _=ippsMinMaxIndx_32f(pSrc,len,pMin,pMinIndx,pMax,pMaxIndx) }
  public static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT) { _=ippsMean_32f(pSrc,len,pMean,ippAlgHintFast) }
  public static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT) { _=ippsStdDev_32f(pSrc,len,pStdDev,ippAlgHintFast) }
  public static func meanStdDev(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT, _ pStdDev:MutPtrT) { _=ippsMeanStdDev_32f(pSrc,len,pMean,pStdDev,ippAlgHintFast) }
  public static func norm_Inf(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_Inf_32f(pSrc,len,pNorm) }
  public static func norm_L1(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_L1_32f(pSrc,len,pNorm) }
  public static func norm_L2(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_L2_32f(pSrc,len,pNorm) }
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_Inf_32f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L1_32f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L2_32f(pSrc1,pSrc2,len,pNorm) }
  public static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pDp:MutPtrT) { _=ippsDotProd_32f(pSrc1,pSrc2,len,pDp) }
  public static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) { _=ippsMinEvery_32f(pSrc1,pSrc2,pDst,len) }
  public static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) { _=ippsMaxEvery_32f(pSrc1,pSrc2,pDst,len) }
  public static func maxOrder(_ pSrc:PtrT, _ len:Int32, _ pOrder:UnsafeMutablePointer<Int32>) { _=ippsMaxOrder_32f(pSrc,len,pOrder) }
  public static func sampleUp(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>) { _=ippsSampleUp_32f(pSrc,srcLen,pDst,pDstLen,factor,pPhase) }
  public static func sampleDown(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>) { _=ippsSampleDown_32f(pSrc,srcLen,pDst,pDstLen,factor,pPhase) }
  public static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ maskSize:Int32, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>) { _=ippsFilterMedian_32f(pSrc,pDst,len,maskSize,pDlySrc,pDlyDst,pBuffer) }
  public static func floor(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsFloor_32f(a,r,n) }
  public static func ceil(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsCeil_32f(a,r,n) }
  public static func trunc(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsTrunc_32f(a,r,n) }
  public static func round(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsRound_32f(a,r,n) }
  public static func rint(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsRint_32f(a,r,n) }
  public static func nearbyInt(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsNearbyInt_32f(a,r,n) }
  public static func modf(_ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT, _ n:Int32) { _=ippsModf_32f(a,r1,r2,n) }
  public static func frac(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsFrac_32f(a,r,n) }
}
extension Double : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }

  public func pow(_ b: Double) -> Double {return Foundation.pow(self, b)}
  public func min(_ b: Double) -> Double {return Swift.min(self, b)}
  public func max(_ b: Double) -> Double {return Swift.max(self, b)}

  public static func dot(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32)->T { return cblas_ddot(N,X,incX,Y,incY) }
  public static func doti(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:PtrT)->T { return cblas_ddoti(N,X,indx,Y) }
  public static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_dnrm2(N,X,incX) }
  public static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_dasum(N,X,incX) }
  public static func swap(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_dswap(N,X,incX,Y,incY) }
  public static func copy(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_dcopy(N,X,incX,Y,incY) }
  public static func axpy(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32) { cblas_daxpy(N,alpha,X,incX,Y,incY) }
  public static func axpby(_ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_daxpby(N,alpha,X,incX,beta,Y,incY) }
  public static func axpyi(_ N:Int32, _ alpha:T, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) { cblas_daxpyi(N,alpha,X,indx,Y) }
  public static func gthr(_ N:Int32, _ Y:PtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) { cblas_dgthr(N,Y,X,indx) }
  public static func gthrz(_ N:Int32, _ Y:MutPtrT, _ X:MutPtrT, _ indx:UnsafePointer<Int32>) { cblas_dgthrz(N,Y,X,indx) }
  public static func sctr(_ N:Int32, _ X:PtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT) { cblas_dsctr(N,X,indx,Y) }
  public static func rotg(_ a:MutPtrT, _ b:MutPtrT, _ c:MutPtrT, _ s:MutPtrT) { cblas_drotg(a,b,c,s) }
  public static func rotmg(_ d1:MutPtrT, _ d2:MutPtrT, _ b1:MutPtrT, _ b2:T, _ P:MutPtrT) { cblas_drotmg(d1,d2,b1,b2,P) }
  public static func rot(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ c:T, _ s:T) { cblas_drot(N,X,incX,Y,incY,c,s) }
  public static func roti(_ N:Int32, _ X:MutPtrT, _ indx:UnsafePointer<Int32>, _ Y:MutPtrT, _ c:T, _ s:T) { cblas_droti(N,X,indx,Y,c,s) }
  public static func rotm(_ N:Int32, _ X:MutPtrT, _ incX:Int32, _ Y:MutPtrT, _ incY:Int32, _ P:PtrT) { cblas_drotm(N,X,incX,Y,incY,P) }
  public static func scal(_ N:Int32, _ alpha:T, _ X:MutPtrT, _ incX:Int32) { cblas_dscal(N,alpha,X,incX) }
  public static func gemv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_dgemv(Layout,TransA,M,N,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func gbmv(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ KL:Int32, _ KU:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_dgbmv(Layout,TransA,M,N,KL,KU,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func trmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_dtrmv(Layout,Uplo,TransA,Diag,N,A,lda,X,incX) }
  public static func tbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_dtbmv(Layout,Uplo,TransA,Diag,N,K,A,lda,X,incX) }
  public static func tpmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32) { cblas_dtpmv(Layout,Uplo,TransA,Diag,N,Ap,X,incX) }
  public static func trsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_dtrsv(Layout,Uplo,TransA,Diag,N,A,lda,X,incX) }
  public static func tbsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ X:MutPtrT, _ incX:Int32) { cblas_dtbsv(Layout,Uplo,TransA,Diag,N,K,A,lda,X,incX) }
  public static func tpsv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ N:Int32, _ Ap:PtrT, _ X:MutPtrT, _ incX:Int32) { cblas_dtpsv(Layout,Uplo,TransA,Diag,N,Ap,X,incX) }
  public static func symv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_dsymv(Layout,Uplo,N,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func sbmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_dsbmv(Layout,Uplo,N,K,alpha,A,lda,X,incX,beta,Y,incY) }
  public static func spmv(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ Ap:PtrT, _ X:PtrT, _ incX:Int32, _ beta:T, _ Y:MutPtrT, _ incY:Int32) { cblas_dspmv(Layout,Uplo,N,alpha,Ap,X,incX,beta,Y,incY) }
  public static func ger(_ Layout:CBLAS_LAYOUT, _ M:Int32, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_dger(Layout,M,N,alpha,X,incX,Y,incY,A,lda) }
  public static func syr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_dsyr(Layout,Uplo,N,alpha,X,incX,A,lda) }
  public static func spr(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Ap:MutPtrT) { cblas_dspr(Layout,Uplo,N,alpha,X,incX,Ap) }
  public static func syr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT, _ lda:Int32) { cblas_dsyr2(Layout,Uplo,N,alpha,X,incX,Y,incY,A,lda) }
  public static func spr2(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ N:Int32, _ alpha:T, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32, _ A:MutPtrT) { cblas_dspr2(Layout,Uplo,N,alpha,X,incX,Y,incY,A) }
  public static func gemm(_ Layout:CBLAS_LAYOUT, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dgemm(Layout,TransA,TransB,M,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func gemmt(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ TransB:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dgemmt(Layout,Uplo,TransA,TransB,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func symm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dsymm(Layout,Side,Uplo,M,N,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func syrk(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dsyrk(Layout,Uplo,Trans,N,K,alpha,A,lda,beta,C,ldc) }
  public static func syr2k(_ Layout:CBLAS_LAYOUT, _ Uplo:CBLAS_UPLO, _ Trans:CBLAS_TRANSPOSE, _ N:Int32, _ K:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dsyr2k(Layout,Uplo,Trans,N,K,alpha,A,lda,B,ldb,beta,C,ldc) }
  public static func trmm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32) { cblas_dtrmm(Layout,Side,Uplo,TransA,Diag,M,N,alpha,A,lda,B,ldb) }
  public static func trsm(_ Layout:CBLAS_LAYOUT, _ Side:CBLAS_SIDE, _ Uplo:CBLAS_UPLO, _ TransA:CBLAS_TRANSPOSE, _ Diag:CBLAS_DIAG, _ M:Int32, _ N:Int32, _ alpha:T, _ A:PtrT, _ lda:Int32, _ B:MutPtrT, _ ldb:Int32) { cblas_dtrsm(Layout,Side,Uplo,TransA,Diag,M,N,alpha,A,lda,B,ldb) }
  public static func gemm_pack_get_size(_ identifier:CBLAS_IDENTIFIER, _ M:Int32, _ N:Int32, _ K:Int32)->Int32 { return cblas_dgemm_pack_get_size(identifier,M,N,K) }
  public static func gemm_pack(_ Layout:CBLAS_LAYOUT, _ identifier:CBLAS_IDENTIFIER, _ Trans:CBLAS_TRANSPOSE, _ M:Int32, _ N:Int32, _ K:Int32, _ alpha:T, _ src:PtrT, _ ld:Int32, _ dest:MutPtrT) { cblas_dgemm_pack(Layout,identifier,Trans,M,N,K,alpha,src,ld,dest) }
  public static func gemm_compute(_ Layout:CBLAS_LAYOUT, _ TransA:Int32, _ TransB:Int32, _ M:Int32, _ N:Int32, _ K:Int32, _ A:PtrT, _ lda:Int32, _ B:PtrT, _ ldb:Int32, _ beta:T, _ C:MutPtrT, _ ldc:Int32) { cblas_dgemm_compute(Layout,TransA,TransB,M,N,K,A,lda,B,ldb,beta,C,ldc) }
  public static func gemm_free(_ dest:MutPtrT) { cblas_dgemm_free(dest) }

  public static func abs(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAbs(n,a,r) }
  public static func add(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdAdd(n,a,b,r) }
  public static func sub(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdSub(n,a,b,r) }
  public static func inv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdInv(n,a,r) }
  public static func sqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSqrt(n,a,r) }
  public static func invSqrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdInvSqrt(n,a,r) }
  public static func cbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCbrt(n,a,r) }
  public static func invCbrt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdInvCbrt(n,a,r) }
  public static func sqr(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSqr(n,a,r) }
  public static func exp(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExp(n,a,r) }
  public static func exp2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExp2(n,a,r) }
  public static func exp10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExp10(n,a,r) }
  public static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExpm1(n,a,r) }
  public static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLn(n,a,r) }
  public static func log2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLog2(n,a,r) }
  public static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLog10(n,a,r) }
  public static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLog1p(n,a,r) }
  public static func logb(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLogb(n,a,r) }
  public static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCos(n,a,r) }
  public static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSin(n,a,r) }
  public static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTan(n,a,r) }
  public static func cospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCospi(n,a,r) }
  public static func sinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSinpi(n,a,r) }
  public static func tanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTanpi(n,a,r) }
  public static func cosd(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCosd(n,a,r) }
  public static func sind(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSind(n,a,r) }
  public static func tand(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTand(n,a,r) }
  public static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCosh(n,a,r) }
  public static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSinh(n,a,r) }
  public static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTanh(n,a,r) }
  public static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAcos(n,a,r) }
  public static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAsin(n,a,r) }
  public static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAtan(n,a,r) }
  public static func acospi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAcospi(n,a,r) }
  public static func asinpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAsinpi(n,a,r) }
  public static func atanpi(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAtanpi(n,a,r) }
  public static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAcosh(n,a,r) }
  public static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAsinh(n,a,r) }
  public static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAtanh(n,a,r) }
  public static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErf(n,a,r) }
  public static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErfInv(n,a,r) }
  public static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdHypot(n,a,b,r) }
  public static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErfc(n,a,r) }
  public static func erfcInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErfcInv(n,a,r) }
  public static func cdfNorm(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCdfNorm(n,a,r) }
  public static func cdfNormInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCdfNormInv(n,a,r) }
  public static func lGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLGamma(n,a,r) }
  public static func tGamma(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTGamma(n,a,r) }
  public static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdAtan2(n,a,b,r) }
  public static func atan2pi(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdAtan2pi(n,a,b,r) }
  public static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdMul(n,a,b,r) }
  public static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdDiv(n,a,b,r) }
  public static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdPow(n,a,b,r) }
  public static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdPow3o2(n,a,r) }
  public static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdPow2o3(n,a,r) }
  public static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT) { vdPowx(n,a,b,r) }
  public static func powr(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdPowr(n,a,b,r) }
  public static func sinCos(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdSinCos(n,a,r1,r2) }
  public static func linearFrac(_ n:Int32, _ a:PtrT, _ b:PtrT, _ scalea:T, _ shifta:T, _ scaleb:T, _ shiftb:T, _ r:MutPtrT) { vdLinearFrac(n,a,b,scalea,shifta,scaleb,shiftb,r) }
  public static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCeil(n,a,r) }
  public static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdFloor(n,a,r) }
  public static func frac(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdFrac(n,a,r) }
  public static func modf(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdModf(n,a,r1,r2) }
  public static func fmod(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdFmod(n,a,r1,r2) }
  public static func remainder(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdRemainder(n,a,r1,r2) }
  public static func nextAfter(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdNextAfter(n,a,r1,r2) }
  public static func copySign(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdCopySign(n,a,r1,r2) }
  public static func fdim(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdFdim(n,a,r1,r2) }
  public static func fmax(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdFmax(n,a,r1,r2) }
  public static func fmin(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdFmin(n,a,r1,r2) }
  public static func maxMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdMaxMag(n,a,r1,r2) }
  public static func minMag(_ n:Int32, _ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT) { vdMinMag(n,a,r1,r2) }
  public static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdNearbyInt(n,a,r) }
  public static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdRint(n,a,r) }
  public static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdRound(n,a,r) }
  public static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTrunc(n,a,r) }
  public static func expInt1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExpInt1(n,a,r) }
  public static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT) { vdPackI(n,a,incra,y) }
  public static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) { vdPackV(n,a,ia,y) }
  public static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) { vdPackM(n,a,ma,y) }
  public static func unpackI(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ incry:Int32) { vdUnpackI(n,a,y,incry) }
  public static func unpackV(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ iy:UnsafePointer<Int32>) { vdUnpackV(n,a,y,iy) }
  public static func unpackM(_ n:Int32, _ a:PtrT, _ y:MutPtrT, _ my:UnsafePointer<Int32>) { vdUnpackM(n,a,y,my) }

  public static func copy(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsCopy_64f(pSrc,pDst,len) }
  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMove_64f(pSrc,pDst,len) }
  public static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSet_64f(val,pDst,len) }
  public static func zero(_ pDst:MutPtrT, _ len:Int32) { _=ippsZero_64f(pDst,len) }
  public static func triangle(_ pDst:MutPtrT, _ len:Int32, _ magn:T, _ rFreq:T, _ asym:T, _ pPhase:MutPtrT) { _=ippsTriangle_64f(pDst,len,magn,rFreq,asym,pPhase) }
  public static func vectorJaehne(_ pDst:MutPtrT, _ len:Int32, _ magn:T) { _=ippsVectorJaehne_64f(pDst,len,magn) }
  public static func vectorSlope(_ pDst:MutPtrT, _ len:Int32, _ offset:T, _ slope:T) { _=ippsVectorSlope_64f(pDst,len,offset,slope) }
  public static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsAddC_64f(pSrc,val,pDst,len) }
  public static func add(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsAdd_64f(pSrc1,pSrc2,pDst,len) }
  public static func addProductC(_ pSrc:PtrT, _ val:T, _ pSrcDst:MutPtrT, _ len:Int32) { _=ippsAddProductC_64f(pSrc,val,pSrcDst,len) }
  public static func addProduct(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pSrcDst:MutPtrT, _ len:Int32) { _=ippsAddProduct_64f(pSrc1,pSrc2,pSrcDst,len) }
  public static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsMulC_64f(pSrc,val,pDst,len) }
  public static func mul(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMul_64f(pSrc1,pSrc2,pDst,len) }
  public static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubC_64f(pSrc,val,pDst,len) }
  public static func subCRev(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubCRev_64f(pSrc,val,pDst,len) }
  public static func sub(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSub_64f(pSrc1,pSrc2,pDst,len) }
  public static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsDivC_64f(pSrc,val,pDst,len) }
  public static func div(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsDiv_64f(pSrc1,pSrc2,pDst,len) }
  public static func abs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsAbs_64f(pSrc,pDst,len) }
  public static func sqr(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSqr_64f(pSrc,pDst,len) }
  public static func sqrt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsSqrt_64f(pSrc,pDst,len) }
  public static func exp(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsExp_64f(pSrc,pDst,len) }
  public static func ln(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsLn_64f(pSrc,pDst,len) }
  public static func sumLn(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSumLn_64f(pSrc,len,pSum) }
  public static func arctan(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsArctan_64f(pSrc,pDst,len) }
  public static func normalize(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ vSub:T, _ vDiv:T) { _=ippsNormalize_64f(pSrc,pDst,len,vSub,vDiv) }
  public static func magnitude(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMagnitude_64f(pSrcRe,pSrcIm,pDst,len) }
  public static func phase(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsPhase_64f(pSrcRe,pSrcIm,pDst,len) }
  public static func powerSpectr(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsPowerSpectr_64f(pSrcRe,pSrcIm,pDst,len) }
  public static func threshold_LT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LT_64f(pSrc,pDst,len,level) }
  public static func threshold_GT(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_GT_64f(pSrc,pDst,len,level) }
  public static func threshold_LTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LTAbs_64f(pSrc,pDst,len,level) }
  public static func threshold_GTAbs(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_GTAbs_64f(pSrc,pDst,len,level) }
  public static func threshold_LTAbsVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_LTAbsVal_64f(pSrc,pDst,len,level,value) }
  public static func threshold_LTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_LTVal_64f(pSrc,pDst,len,level,value) }
  public static func threshold_GTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T, _ value:T) { _=ippsThreshold_GTVal_64f(pSrc,pDst,len,level,value) }
  public static func threshold_LTValGTVal(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ levelLT:T, _ valueLT:T, _ levelGT:T, _ valueGT:T) { _=ippsThreshold_LTValGTVal_64f(pSrc,pDst,len,levelLT,valueLT,levelGT,valueGT) }
  public static func threshold_LTInv(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ level:T) { _=ippsThreshold_LTInv_64f(pSrc,pDst,len,level) }
  public static func cartToPolar(_ pSrcRe:PtrT, _ pSrcIm:PtrT, _ pDstMagn:MutPtrT, _ pDstPhase:MutPtrT, _ len:Int32) { _=ippsCartToPolar_64f(pSrcRe,pSrcIm,pDstMagn,pDstPhase,len) }
  public static func polarToCart(_ pSrcMagn:PtrT, _ pSrcPhase:PtrT, _ pDstRe:MutPtrT, _ pDstIm:MutPtrT, _ len:Int32) { _=ippsPolarToCart_64f(pSrcMagn,pSrcPhase,pDstRe,pDstIm,len) }
  public static func flip(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsFlip_64f(pSrc,pDst,len) }
  public static func winBartlett(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBartlett_64f(pSrc,pDst,len) }
  public static func winHann(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinHann_64f(pSrc,pDst,len) }
  public static func winHamming(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinHamming_64f(pSrc,pDst,len) }
  public static func winBlackman(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T) { _=ippsWinBlackman_64f(pSrc,pDst,len,alpha) }
  public static func winBlackmanStd(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBlackmanStd_64f(pSrc,pDst,len) }
  public static func winBlackmanOpt(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsWinBlackmanOpt_64f(pSrc,pDst,len) }
  public static func winKaiser(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ alpha:T) { _=ippsWinKaiser_64f(pSrc,pDst,len,alpha) }
  public static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSum_64f(pSrc,len,pSum) }
  public static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT) { _=ippsMin_64f(pSrc,len,pMin) }
  public static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT) { _=ippsMax_64f(pSrc,len,pMax) }
  public static func minMax(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMax:MutPtrT) { _=ippsMinMax_64f(pSrc,len,pMin,pMax) }
  public static func minAbs(_ pSrc:PtrT, _ len:Int32, _ pMinAbs:MutPtrT) { _=ippsMinAbs_64f(pSrc,len,pMinAbs) }
  public static func maxAbs(_ pSrc:PtrT, _ len:Int32, _ pMaxAbs:MutPtrT) { _=ippsMaxAbs_64f(pSrc,len,pMaxAbs) }
  public static func minIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) { _=ippsMinIndx_64f(pSrc,len,pMin,pIndx) }
  public static func maxIndx(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT, _ pIndx:UnsafeMutablePointer<Int32>) { _=ippsMaxIndx_64f(pSrc,len,pMax,pIndx) }
  public static func minMaxIndx(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT, _ pMinIndx:UnsafeMutablePointer<Int32>, _ pMax:MutPtrT, _ pMaxIndx:UnsafeMutablePointer<Int32>) { _=ippsMinMaxIndx_64f(pSrc,len,pMin,pMinIndx,pMax,pMaxIndx) }
  public static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT) { _=ippsMean_64f(pSrc,len,pMean) }
  public static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT) { _=ippsStdDev_64f(pSrc,len,pStdDev) }
  public static func meanStdDev(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT, _ pStdDev:MutPtrT) { _=ippsMeanStdDev_64f(pSrc,len,pMean,pStdDev) }
  public static func norm_Inf(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_Inf_64f(pSrc,len,pNorm) }
  public static func norm_L1(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_L1_64f(pSrc,len,pNorm) }
  public static func norm_L2(_ pSrc:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNorm_L2_64f(pSrc,len,pNorm) }
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_Inf_64f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L1_64f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L2_64f(pSrc1,pSrc2,len,pNorm) }
  public static func dotProd(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pDp:MutPtrT) { _=ippsDotProd_64f(pSrc1,pSrc2,len,pDp) }
  public static func minEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) { _=ippsMinEvery_64f(pSrc1,pSrc2,pDst,len) }
  public static func maxEvery(_ pSrc1:PtrT, _ pSrc2:PtrT, _ pDst:MutPtrT, _ len:UInt32) { _=ippsMaxEvery_64f(pSrc1,pSrc2,pDst,len) }
  public static func maxOrder(_ pSrc:PtrT, _ len:Int32, _ pOrder:UnsafeMutablePointer<Int32>) { _=ippsMaxOrder_64f(pSrc,len,pOrder) }
  public static func sampleUp(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>) { _=ippsSampleUp_64f(pSrc,srcLen,pDst,pDstLen,factor,pPhase) }
  public static func sampleDown(_ pSrc:PtrT, _ srcLen:Int32, _ pDst:MutPtrT, _ pDstLen:UnsafeMutablePointer<Int32>, _ factor:Int32, _ pPhase:UnsafeMutablePointer<Int32>) { _=ippsSampleDown_64f(pSrc,srcLen,pDst,pDstLen,factor,pPhase) }
  public static func filterMedian(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32, _ maskSize:Int32, _ pDlySrc:PtrT, _ pDlyDst:MutPtrT, _ pBuffer:UnsafeMutablePointer<UInt8>) { _=ippsFilterMedian_64f(pSrc,pDst,len,maskSize,pDlySrc,pDlyDst,pBuffer) }
  public static func floor(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsFloor_64f(a,r,n) }
  public static func ceil(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsCeil_64f(a,r,n) }
  public static func trunc(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsTrunc_64f(a,r,n) }
  public static func round(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsRound_64f(a,r,n) }
  public static func rint(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsRint_64f(a,r,n) }
  public static func nearbyInt(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsNearbyInt_64f(a,r,n) }
  public static func modf(_ a:PtrT, _ r1:MutPtrT, _ r2:MutPtrT, _ n:Int32) { _=ippsModf_64f(a,r1,r2,n) }
  public static func frac(_ a:PtrT, _ r:MutPtrT, _ n:Int32) { _=ippsFrac_64f(a,r,n) }
}

extension SupportsMKL {
  public func acos() -> Self {return .init(Foundation.acos(cgfloat))}
  public func acosh() -> Self {return .init(Foundation.acosh(cgfloat))}
  public func asin() -> Self {return .init(Foundation.asin(cgfloat))}
  public func asinh() -> Self {return .init(Foundation.asinh(cgfloat))}
  public func atan() -> Self {return .init(Foundation.atan(cgfloat))}
  public func atanh() -> Self {return .init(Foundation.atanh(cgfloat))}
  public func cbrt() -> Self {return .init(Foundation.cbrt(cgfloat))}
  public func cos() -> Self {return .init(Foundation.cos(cgfloat))}
  public func cosh() -> Self {return .init(Foundation.cosh(cgfloat))}
  public func erf() -> Self {return .init(Foundation.erf(cgfloat))}
  public func erfc() -> Self {return .init(Foundation.erfc(cgfloat))}
  public func exp() -> Self {return .init(Foundation.exp(cgfloat))}
  public func exp2() -> Self {return .init(Foundation.exp2(cgfloat))}
  public func expm1() -> Self {return .init(Foundation.expm1(cgfloat))}
  public func j0() -> Self {return .init(Foundation.j0(cgfloat))}
  public func j1() -> Self {return .init(Foundation.j1(cgfloat))}
  public func log() -> Self {return .init(Foundation.log(cgfloat))}
  public func log10() -> Self {return .init(Foundation.log10(cgfloat))}
  public func log1p() -> Self {return .init(Foundation.log1p(cgfloat))}
  public func log2() -> Self {return .init(Foundation.log2(cgfloat))}
  public func logb() -> Self {return .init(Foundation.logb(cgfloat))}
  public func nearbyint() -> Self {return .init(Foundation.nearbyint(cgfloat))}
  public func rint() -> Self {return .init(Foundation.rint(cgfloat))}
  public func sin() -> Self {return .init(Foundation.sin(cgfloat))}
  public func sinh() -> Self {return .init(Foundation.sinh(cgfloat))}
  public func tan() -> Self {return .init(Foundation.tan(cgfloat))}
  public func tanh() -> Self {return .init(Foundation.tanh(cgfloat))}
  public func tgamma() -> Self {return .init(Foundation.tgamma(cgfloat))}
  public func y0() -> Self {return .init(Foundation.y0(cgfloat))}
  public func y1() -> Self {return .init(Foundation.y1(cgfloat))}

  public func atan2(_ b: Self) -> Self {return .init(Foundation.atan2(cgfloat, b.cgfloat))}
  public func copysign(_ b: Self) -> Self {return .init(Foundation.copysign(cgfloat, b.cgfloat))}
  public func fdim(_ b: Self) -> Self {return .init(Foundation.fdim(cgfloat, b.cgfloat))}
  public func fmax(_ b: Self) -> Self {return .init(Foundation.fmax(cgfloat, b.cgfloat))}
  public func fmin(_ b: Self) -> Self {return .init(Foundation.fmin(cgfloat, b.cgfloat))}
  public func hypot(_ b: Self) -> Self {return .init(Foundation.hypot(cgfloat, b.cgfloat))}
  public func nextafter(_ b: Self) -> Self {return .init(Foundation.nextafter(cgfloat, b.cgfloat))}
}

precedencegroup ExponentiationPrecedence { associativity: right higherThan: MultiplicationPrecedence }
infix operator ^^: ExponentiationPrecedence

public func ^^<T:SupportsMKL> (base:T, power:T) -> T {
  return base.pow(power)
}

