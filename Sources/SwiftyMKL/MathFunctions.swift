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
  static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T
  static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T

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
  static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT)
  static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT)
  static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT)
  static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT)
  static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT)
  static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT)

  static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32)
  static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func zero(_ pDst:MutPtrT, _ len:Int32)
  static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32)
  static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT)
  static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT)
  static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT)
  static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT)
  static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT)
  static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
  static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT)
}

extension Float : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }

  public func pow(_ b: Float) -> Float {return Foundation.pow(self, b)}
  public func min(_ b: Float) -> Float {return Swift.min(self, b)}
  public func max(_ b: Float) -> Float {return Swift.max(self, b)}

  public static func dot(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32)->T { return cblas_sdot(N,X,incX,Y,incY) }
  public static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_snrm2(N,X,incX) }
  public static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_sasum(N,X,incX) }

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
  public static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsExpm1(n,a,r) }
  public static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLn(n,a,r) }
  public static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLog10(n,a,r) }
  public static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsLog1p(n,a,r) }
  public static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCos(n,a,r) }
  public static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSin(n,a,r) }
  public static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTan(n,a,r) }
  public static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCosh(n,a,r) }
  public static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsSinh(n,a,r) }
  public static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTanh(n,a,r) }
  public static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAcos(n,a,r) }
  public static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAsin(n,a,r) }
  public static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAtan(n,a,r) }
  public static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAcosh(n,a,r) }
  public static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAsinh(n,a,r) }
  public static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsAtanh(n,a,r) }
  public static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErf(n,a,r) }
  public static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErfInv(n,a,r) }
  public static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsHypot(n,a,b,r) }
  public static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsErfc(n,a,r) }
  public static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsAtan2(n,a,b,r) }
  public static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsMul(n,a,b,r) }
  public static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsDiv(n,a,b,r) }
  public static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vsPow(n,a,b,r) }
  public static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsPow3o2(n,a,r) }
  public static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsPow2o3(n,a,r) }
  public static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT) { vsPowx(n,a,b,r) }
  public static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsCeil(n,a,r) }
  public static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsFloor(n,a,r) }
  public static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsNearbyInt(n,a,r) }
  public static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsRint(n,a,r) }
  public static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsRound(n,a,r) }
  public static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vsTrunc(n,a,r) }
  public static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT) { vsPackI(n,a,incra,y) }
  public static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) { vsPackV(n,a,ia,y) }
  public static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) { vsPackM(n,a,ma,y) }

  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMove_32f(pSrc,pDst,len) }
  public static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSet_32f(val,pDst,len) }
  public static func zero(_ pDst:MutPtrT, _ len:Int32) { _=ippsZero_32f(pDst,len) }
  public static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsAddC_32f(pSrc,val,pDst,len) }
  public static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsMulC_32f(pSrc,val,pDst,len) }
  public static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubC_32f(pSrc,val,pDst,len) }
  public static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsDivC_32f(pSrc,val,pDst,len) }
  public static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSum_32f(pSrc,len,pSum,ippAlgHintFast) }
  public static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT) { _=ippsMin_32f(pSrc,len,pMin) }
  public static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT) { _=ippsMax_32f(pSrc,len,pMax) }
  public static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT) { _=ippsMean_32f(pSrc,len,pMean,ippAlgHintFast) }
  public static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT) { _=ippsStdDev_32f(pSrc,len,pStdDev,ippAlgHintFast) }
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_Inf_32f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L1_32f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L2_32f(pSrc1,pSrc2,len,pNorm) }
}
extension Double : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }

  public func pow(_ b: Double) -> Double {return Foundation.pow(self, b)}
  public func min(_ b: Double) -> Double {return Swift.min(self, b)}
  public func max(_ b: Double) -> Double {return Swift.max(self, b)}

  public static func dot(_ N:Int32, _ X:PtrT, _ incX:Int32, _ Y:PtrT, _ incY:Int32)->T { return cblas_ddot(N,X,incX,Y,incY) }
  public static func nrm2(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_dnrm2(N,X,incX) }
  public static func asum(_ N:Int32, _ X:PtrT, _ incX:Int32)->T { return cblas_dasum(N,X,incX) }

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
  public static func expm1(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdExpm1(n,a,r) }
  public static func ln(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLn(n,a,r) }
  public static func log10(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLog10(n,a,r) }
  public static func log1p(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdLog1p(n,a,r) }
  public static func cos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCos(n,a,r) }
  public static func sin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSin(n,a,r) }
  public static func tan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTan(n,a,r) }
  public static func cosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCosh(n,a,r) }
  public static func sinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdSinh(n,a,r) }
  public static func tanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTanh(n,a,r) }
  public static func acos(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAcos(n,a,r) }
  public static func asin(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAsin(n,a,r) }
  public static func atan(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAtan(n,a,r) }
  public static func acosh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAcosh(n,a,r) }
  public static func asinh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAsinh(n,a,r) }
  public static func atanh(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdAtanh(n,a,r) }
  public static func erf(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErf(n,a,r) }
  public static func erfInv(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErfInv(n,a,r) }
  public static func hypot(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdHypot(n,a,b,r) }
  public static func erfc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdErfc(n,a,r) }
  public static func atan2(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdAtan2(n,a,b,r) }
  public static func mul(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdMul(n,a,b,r) }
  public static func div(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdDiv(n,a,b,r) }
  public static func pow(_ n:Int32, _ a:PtrT, _ b:PtrT, _ r:MutPtrT) { vdPow(n,a,b,r) }
  public static func pow3o2(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdPow3o2(n,a,r) }
  public static func pow2o3(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdPow2o3(n,a,r) }
  public static func powx(_ n:Int32, _ a:PtrT, _ b:T, _ r:MutPtrT) { vdPowx(n,a,b,r) }
  public static func ceil(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdCeil(n,a,r) }
  public static func floor(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdFloor(n,a,r) }
  public static func nearbyInt(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdNearbyInt(n,a,r) }
  public static func rint(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdRint(n,a,r) }
  public static func round(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdRound(n,a,r) }
  public static func trunc(_ n:Int32, _ a:PtrT, _ r:MutPtrT) { vdTrunc(n,a,r) }
  public static func packI(_ n:Int32, _ a:PtrT, _ incra:Int32, _ y:MutPtrT) { vdPackI(n,a,incra,y) }
  public static func packV(_ n:Int32, _ a:PtrT, _ ia:UnsafePointer<Int32>, _ y:MutPtrT) { vdPackV(n,a,ia,y) }
  public static func packM(_ n:Int32, _ a:PtrT, _ ma:UnsafePointer<Int32>, _ y:MutPtrT) { vdPackM(n,a,ma,y) }

  public static func move(_ pSrc:PtrT, _ pDst:MutPtrT, _ len:Int32) { _=ippsMove_64f(pSrc,pDst,len) }
  public static func set(_ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSet_64f(val,pDst,len) }
  public static func zero(_ pDst:MutPtrT, _ len:Int32) { _=ippsZero_64f(pDst,len) }
  public static func addC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsAddC_64f(pSrc,val,pDst,len) }
  public static func mulC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsMulC_64f(pSrc,val,pDst,len) }
  public static func subC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsSubC_64f(pSrc,val,pDst,len) }
  public static func divC(_ pSrc:PtrT, _ val:T, _ pDst:MutPtrT, _ len:Int32) { _=ippsDivC_64f(pSrc,val,pDst,len) }
  public static func sum(_ pSrc:PtrT, _ len:Int32, _ pSum:MutPtrT) { _=ippsSum_64f(pSrc,len,pSum) }
  public static func min(_ pSrc:PtrT, _ len:Int32, _ pMin:MutPtrT) { _=ippsMin_64f(pSrc,len,pMin) }
  public static func max(_ pSrc:PtrT, _ len:Int32, _ pMax:MutPtrT) { _=ippsMax_64f(pSrc,len,pMax) }
  public static func mean(_ pSrc:PtrT, _ len:Int32, _ pMean:MutPtrT) { _=ippsMean_64f(pSrc,len,pMean) }
  public static func stdDev(_ pSrc:PtrT, _ len:Int32, _ pStdDev:MutPtrT) { _=ippsStdDev_64f(pSrc,len,pStdDev) }
  public static func normDiff_Inf(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_Inf_64f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L1(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L1_64f(pSrc1,pSrc2,len,pNorm) }
  public static func normDiff_L2(_ pSrc1:PtrT, _ pSrc2:PtrT, _ len:Int32, _ pNorm:MutPtrT) { _=ippsNormDiff_L2_64f(pSrc1,pSrc2,len,pNorm) }
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

