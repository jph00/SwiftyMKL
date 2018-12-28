import Foundation
import CMKL
import CIPP

public func defaultValue<T>() -> T {
  let ptr = UnsafeMutablePointer<T>.allocate(capacity:1)
  let retval = ptr.pointee
  ptr.deallocate()
  return retval;
}


public protocol Vector: BaseVector where Storage==ArrayStorage<Scalar> {
  var p:MutPtrT {get}
  func asum()->Scalar
  func nrm2()->Scalar
  func dot(_ b:Self)->Scalar
  func ln(_ dest: Self)
  func ln_()
  func ln()->Self
  func abs(_ dest: Self)
  func abs_()
  func abs()->Self
  func inv(_ dest: Self)
  func inv_()
  func inv()->Self
  func sqr(_ dest: Self)
  func sqr_()
  func sqr()->Self
  func exp(_ dest: Self)
  func exp_()
  func exp()->Self
  func cos(_ dest: Self)
  func cos_()
  func cos()->Self
  func sin(_ dest: Self)
  func sin_()
  func sin()->Self
  func tan(_ dest: Self)
  func tan_()
  func tan()->Self
  func erf(_ dest: Self)
  func erf_()
  func erf()->Self
  func sqrt(_ dest: Self)
  func sqrt_()
  func sqrt()->Self
  func cbrt(_ dest: Self)
  func cbrt_()
  func cbrt()->Self
  func cosh(_ dest: Self)
  func cosh_()
  func cosh()->Self
  func sinh(_ dest: Self)
  func sinh_()
  func sinh()->Self
  func tanh(_ dest: Self)
  func tanh_()
  func tanh()->Self
  func acos(_ dest: Self)
  func acos_()
  func acos()->Self
  func asin(_ dest: Self)
  func asin_()
  func asin()->Self
  func atan(_ dest: Self)
  func atan_()
  func atan()->Self
  func erfc(_ dest: Self)
  func erfc_()
  func erfc()->Self
  func ceil(_ dest: Self)
  func ceil_()
  func ceil()->Self
  func rint(_ dest: Self)
  func rint_()
  func rint()->Self
  func expm1(_ dest: Self)
  func expm1_()
  func expm1()->Self
  func log10(_ dest: Self)
  func log10_()
  func log10()->Self
  func log1p(_ dest: Self)
  func log1p_()
  func log1p()->Self
  func acosh(_ dest: Self)
  func acosh_()
  func acosh()->Self
  func asinh(_ dest: Self)
  func asinh_()
  func asinh()->Self
  func atanh(_ dest: Self)
  func atanh_()
  func atanh()->Self
  func floor(_ dest: Self)
  func floor_()
  func floor()->Self
  func round(_ dest: Self)
  func round_()
  func round()->Self
  func trunc(_ dest: Self)
  func trunc_()
  func trunc()->Self
  func erfInv(_ dest: Self)
  func erfInv_()
  func erfInv()->Self
  func pow3o2(_ dest: Self)
  func pow3o2_()
  func pow3o2()->Self
  func pow2o3(_ dest: Self)
  func pow2o3_()
  func pow2o3()->Self
  func invSqrt(_ dest: Self)
  func invSqrt_()
  func invSqrt()->Self
  func invCbrt(_ dest: Self)
  func invCbrt_()
  func invCbrt()->Self
  func nearbyInt(_ dest: Self)
  func nearbyInt_()
  func nearbyInt()->Self

  func sum()->Scalar
  func mean()->Scalar
  func stdDev()->Scalar
  func max()->Scalar
  func min()->Scalar

  func add(_ b:Self, _ dest:Self)
  func add_(_ b:Self)
  func add(_ b:Self)->Self
  func sub(_ b:Self, _ dest:Self)
  func sub_(_ b:Self)
  func sub(_ b:Self)->Self
  func mul(_ b:Self, _ dest:Self)
  func mul_(_ b:Self)
  func mul(_ b:Self)->Self
  func div(_ b:Self, _ dest:Self)
  func div_(_ b:Self)
  func div(_ b:Self)->Self
  func pow(_ b:Self, _ dest:Self)
  func pow_(_ b:Self)
  func pow(_ b:Self)->Self
  func hypot(_ b:Self, _ dest:Self)
  func hypot_(_ b:Self)
  func hypot(_ b:Self)->Self
  func atan2(_ b:Self, _ dest:Self)
  func atan2_(_ b:Self)
  func atan2(_ b:Self)->Self

  func powx(_ b:Scalar, _ dest:Self)
  func powx_(_ b:Scalar)
  func powx(_ b:Scalar)->Self

  func add(_ b:Scalar, _ dest:Self)
  func add_(_ b:Scalar)
  func add(_ b:Scalar)->Self
  func sub(_ b:Scalar, _ dest:Self)
  func sub_(_ b:Scalar)
  func sub(_ b:Scalar)->Self
  func mul(_ b:Scalar, _ dest:Self)
  func mul_(_ b:Scalar)
  func mul(_ b:Scalar)->Self
  func div(_ b:Scalar, _ dest:Self)
  func div_(_ b:Scalar)
  func div(_ b:Scalar)->Self

  func normDiff_Inf(_ b:Self)->Scalar
  func normDiff_L1(_ b:Self)->Scalar
  func normDiff_L2(_ b:Self)->Scalar

  static func +  (lhs:Self, rhs:Self  ) -> Self 
  static func +  (lhs:Self, rhs:Scalar) -> Self 
  static func += (lhs:Self, rhs:Self) 
  static func += (lhs:Self, rhs:Scalar)
  static func -  (lhs:Self, rhs:Self  ) -> Self 
  static func -  (lhs:Self, rhs:Scalar) -> Self 
  static func -= (lhs:Self, rhs:Self) 
  static func -= (lhs:Self, rhs:Scalar)
  static func *  (lhs:Self, rhs:Self  ) -> Self 
  static func *  (lhs:Self, rhs:Scalar) -> Self 
  static func *= (lhs:Self, rhs:Self) 
  static func *= (lhs:Self, rhs:Scalar)
  static func /  (lhs:Self, rhs:Self  ) -> Self 
  static func /  (lhs:Self, rhs:Scalar) -> Self 
  static func /= (lhs:Self, rhs:Self) 
  static func /= (lhs:Self, rhs:Scalar)
  static func + (lhs:Scalar, rhs:Self) -> Self 
  static func * (lhs:Scalar, rhs:Self) -> Self 
}

extension Vector {
  public var p:MutPtrT {get {return data.p}}
  public var description: String { return "V\(Array(data).description)" }
  public init(_ data:Array<Scalar>) {self.init(ArrayStorage<Scalar>(data))}
  public init(_ count:Int) {self.init(ArrayStorage<Scalar>(count))}
  public var alignment:Int {return data.alignment}

  // IPP convenience functions
  typealias ippFuncReduceHint = (PtrT,Int32,MutPtrT,IppHintAlgorithm)->IppStatus
  typealias ippFuncReduce = (PtrT,Int32,MutPtrT)->IppStatus
  func ipp_reduce(_ f:(MutPtrT)->IppStatus)->Scalar {
    var res:Scalar=defaultValue(); let _=f(&res); return res
  }
  func ipp_reduce(_ f:ippFuncReduceHint)->Scalar { return ipp_reduce({f(p, c, $0, ippAlgHintFast)}) }
  func ipp_reduce(_ f:ippFuncReduce    )->Scalar { return ipp_reduce({f(p, c, $0)}) }

  public func new()  -> Self { return Self.init(ArrayStorage<Scalar>(data.count,  alignment:alignment)) }
  public func copy() -> Self { return Self.init(ArrayStorage<Scalar>(Array(data), alignment:alignment)) }

  func new_call(_ f:(Self)         ->()            )->Self { let res = new(); f(res);    return res }
  func new_call(_ f:(Self, Self)   ->(), _ b:Self  )->Self { let res = new(); f(b, res); return res }
  func new_call(_ f:(Scalar, Self)->(),  _ b:Scalar)->Self { let res = new(); f(b, res); return res }
}

public struct VectorFloat: Vector {
  public typealias Scalar=Float
  public var data:ArrayStorage<Float>
  public init(_ data_:ArrayStorage<Float>) {data=data_}
}
public struct VectorDouble: Vector {
  public typealias Scalar=Double
  public var data:ArrayStorage<Double>
  public init(_ data_:ArrayStorage<Double>) {data=data_}
}

extension Vector where Scalar==Float {
  public func asum()->Scalar { return cblas_sasum(c, p, 1) }
  public func nrm2()->Scalar { return cblas_snrm2(c, p, 1) }
  public func dot(_ b:Self)->Scalar { return cblas_sdot(c, p, 1, b.p, 1) }

    public func ln(_ dest: Self) { vsLn(c, p, dest.p) }
    public func ln_() { ln(self) }
    public func ln() -> Self  { return new_call(ln) }
    public func abs(_ dest: Self) { vsAbs(c, p, dest.p) }
    public func abs_() { abs(self) }
    public func abs() -> Self  { return new_call(abs) }
    public func inv(_ dest: Self) { vsInv(c, p, dest.p) }
    public func inv_() { inv(self) }
    public func inv() -> Self  { return new_call(inv) }
    public func sqr(_ dest: Self) { vsSqr(c, p, dest.p) }
    public func sqr_() { sqr(self) }
    public func sqr() -> Self  { return new_call(sqr) }
    public func exp(_ dest: Self) { vsExp(c, p, dest.p) }
    public func exp_() { exp(self) }
    public func exp() -> Self  { return new_call(exp) }
    public func cos(_ dest: Self) { vsCos(c, p, dest.p) }
    public func cos_() { cos(self) }
    public func cos() -> Self  { return new_call(cos) }
    public func sin(_ dest: Self) { vsSin(c, p, dest.p) }
    public func sin_() { sin(self) }
    public func sin() -> Self  { return new_call(sin) }
    public func tan(_ dest: Self) { vsTan(c, p, dest.p) }
    public func tan_() { tan(self) }
    public func tan() -> Self  { return new_call(tan) }
    public func erf(_ dest: Self) { vsErf(c, p, dest.p) }
    public func erf_() { erf(self) }
    public func erf() -> Self  { return new_call(erf) }
    public func sqrt(_ dest: Self) { vsSqrt(c, p, dest.p) }
    public func sqrt_() { sqrt(self) }
    public func sqrt() -> Self  { return new_call(sqrt) }
    public func cbrt(_ dest: Self) { vsCbrt(c, p, dest.p) }
    public func cbrt_() { cbrt(self) }
    public func cbrt() -> Self  { return new_call(cbrt) }
    public func cosh(_ dest: Self) { vsCosh(c, p, dest.p) }
    public func cosh_() { cosh(self) }
    public func cosh() -> Self  { return new_call(cosh) }
    public func sinh(_ dest: Self) { vsSinh(c, p, dest.p) }
    public func sinh_() { sinh(self) }
    public func sinh() -> Self  { return new_call(sinh) }
    public func tanh(_ dest: Self) { vsTanh(c, p, dest.p) }
    public func tanh_() { tanh(self) }
    public func tanh() -> Self  { return new_call(tanh) }
    public func acos(_ dest: Self) { vsAcos(c, p, dest.p) }
    public func acos_() { acos(self) }
    public func acos() -> Self  { return new_call(acos) }
    public func asin(_ dest: Self) { vsAsin(c, p, dest.p) }
    public func asin_() { asin(self) }
    public func asin() -> Self  { return new_call(asin) }
    public func atan(_ dest: Self) { vsAtan(c, p, dest.p) }
    public func atan_() { atan(self) }
    public func atan() -> Self  { return new_call(atan) }
    public func erfc(_ dest: Self) { vsErfc(c, p, dest.p) }
    public func erfc_() { erfc(self) }
    public func erfc() -> Self  { return new_call(erfc) }
    public func ceil(_ dest: Self) { vsCeil(c, p, dest.p) }
    public func ceil_() { ceil(self) }
    public func ceil() -> Self  { return new_call(ceil) }
    public func rint(_ dest: Self) { vsRint(c, p, dest.p) }
    public func rint_() { rint(self) }
    public func rint() -> Self  { return new_call(rint) }
    public func expm1(_ dest: Self) { vsExpm1(c, p, dest.p) }
    public func expm1_() { expm1(self) }
    public func expm1() -> Self  { return new_call(expm1) }
    public func log10(_ dest: Self) { vsLog10(c, p, dest.p) }
    public func log10_() { log10(self) }
    public func log10() -> Self  { return new_call(log10) }
    public func log1p(_ dest: Self) { vsLog1p(c, p, dest.p) }
    public func log1p_() { log1p(self) }
    public func log1p() -> Self  { return new_call(log1p) }
    public func acosh(_ dest: Self) { vsAcosh(c, p, dest.p) }
    public func acosh_() { acosh(self) }
    public func acosh() -> Self  { return new_call(acosh) }
    public func asinh(_ dest: Self) { vsAsinh(c, p, dest.p) }
    public func asinh_() { asinh(self) }
    public func asinh() -> Self  { return new_call(asinh) }
    public func atanh(_ dest: Self) { vsAtanh(c, p, dest.p) }
    public func atanh_() { atanh(self) }
    public func atanh() -> Self  { return new_call(atanh) }
    public func floor(_ dest: Self) { vsFloor(c, p, dest.p) }
    public func floor_() { floor(self) }
    public func floor() -> Self  { return new_call(floor) }
    public func round(_ dest: Self) { vsRound(c, p, dest.p) }
    public func round_() { round(self) }
    public func round() -> Self  { return new_call(round) }
    public func trunc(_ dest: Self) { vsTrunc(c, p, dest.p) }
    public func trunc_() { trunc(self) }
    public func trunc() -> Self  { return new_call(trunc) }
    public func erfInv(_ dest: Self) { vsErfInv(c, p, dest.p) }
    public func erfInv_() { erfInv(self) }
    public func erfInv() -> Self  { return new_call(erfInv) }
    public func pow3o2(_ dest: Self) { vsPow3o2(c, p, dest.p) }
    public func pow3o2_() { pow3o2(self) }
    public func pow3o2() -> Self  { return new_call(pow3o2) }
    public func pow2o3(_ dest: Self) { vsPow2o3(c, p, dest.p) }
    public func pow2o3_() { pow2o3(self) }
    public func pow2o3() -> Self  { return new_call(pow2o3) }
    public func invSqrt(_ dest: Self) { vsInvSqrt(c, p, dest.p) }
    public func invSqrt_() { invSqrt(self) }
    public func invSqrt() -> Self  { return new_call(invSqrt) }
    public func invCbrt(_ dest: Self) { vsInvCbrt(c, p, dest.p) }
    public func invCbrt_() { invCbrt(self) }
    public func invCbrt() -> Self  { return new_call(invCbrt) }
    public func nearbyInt(_ dest: Self) { vsNearbyInt(c, p, dest.p) }
    public func nearbyInt_() { nearbyInt(self) }
    public func nearbyInt() -> Self  { return new_call(nearbyInt) }

    public func sum()->Scalar { return ipp_reduce(ippsSum_32f) }
    public func mean()->Scalar { return ipp_reduce(ippsMean_32f) }
    public func stdDev()->Scalar { return ipp_reduce(ippsStdDev_32f) }
    public func max()->Scalar { return ipp_reduce(ippsMax_32f) }
    public func min()->Scalar { return ipp_reduce(ippsMin_32f) }

  public func add(_ b:Self, _ dest:Self) { vsAdd(c, p, b.p, dest.p) }
  public func add_(_ b:Self) { add(b, self) }
  public func add(_ b:Self)->Self { return new_call(add, b) }
  public func sub(_ b:Self, _ dest:Self) { vsSub(c, p, b.p, dest.p) }
  public func sub_(_ b:Self) { sub(b, self) }
  public func sub(_ b:Self)->Self { return new_call(sub, b) }
  public func mul(_ b:Self, _ dest:Self) { vsMul(c, p, b.p, dest.p) }
  public func mul_(_ b:Self) { mul(b, self) }
  public func mul(_ b:Self)->Self { return new_call(mul, b) }
  public func div(_ b:Self, _ dest:Self) { vsDiv(c, p, b.p, dest.p) }
  public func div_(_ b:Self) { div(b, self) }
  public func div(_ b:Self)->Self { return new_call(div, b) }
  public func pow(_ b:Self, _ dest:Self) { vsPow(c, p, b.p, dest.p) }
  public func pow_(_ b:Self) { pow(b, self) }
  public func pow(_ b:Self)->Self { return new_call(pow, b) }
  public func hypot(_ b:Self, _ dest:Self) { vsHypot(c, p, b.p, dest.p) }
  public func hypot_(_ b:Self) { hypot(b, self) }
  public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  public func atan2(_ b:Self, _ dest:Self) { vsAtan2(c, p, b.p, dest.p) }
  public func atan2_(_ b:Self) { atan2(b, self) }
  public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  public func powx(_ b:Scalar, _ dest:Self) { vsPowx(c, p, b, dest.p) }
  public func powx_(_ b:Scalar) { powx(b, self) }
  public func powx(_ b:Scalar)->Self { return new_call(powx, b) }

  public func add(_ b:Scalar, _ dest:Self) { ippsAddC_32f(p, b, dest.p, c) }
  public func add_(_ b:Scalar) { add(b, self) }
  public func add(_ b:Scalar)->Self { return new_call(add, b) }
  public func sub(_ b:Scalar, _ dest:Self) { ippsSubC_32f(p, b, dest.p, c) }
  public func sub_(_ b:Scalar) { sub(b, self) }
  public func sub(_ b:Scalar)->Self { return new_call(sub, b) }
  public func mul(_ b:Scalar, _ dest:Self) { ippsMulC_32f(p, b, dest.p, c) }
  public func mul_(_ b:Scalar) { mul(b, self) }
  public func mul(_ b:Scalar)->Self { return new_call(mul, b) }
  public func div(_ b:Scalar, _ dest:Self) { ippsDivC_32f(p, b, dest.p, c) }
  public func div_(_ b:Scalar) { div(b, self) }
  public func div(_ b:Scalar)->Self { return new_call(div, b) }

  public func normDiff_Inf(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_Inf_32f(p, b.p, c, $0)})}
  public func normDiff_L1(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_L1_32f(p, b.p, c, $0)})}
  public func normDiff_L2(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_L2_32f(p, b.p, c, $0)})}

  public static func +  (lhs:Self, rhs:Self  ) -> Self { return lhs.add( rhs) }
  public static func +  (lhs:Self, rhs:Scalar) -> Self { return lhs.add( rhs) }
  public static func += (lhs:Self, rhs:Self  )         { return lhs.add_(rhs) }
  public static func += (lhs:Self, rhs:Scalar)         { return lhs.add_(rhs) }
  public static func -  (lhs:Self, rhs:Self  ) -> Self { return lhs.sub( rhs) }
  public static func -  (lhs:Self, rhs:Scalar) -> Self { return lhs.sub( rhs) }
  public static func -= (lhs:Self, rhs:Self  )         { return lhs.sub_(rhs) }
  public static func -= (lhs:Self, rhs:Scalar)         { return lhs.sub_(rhs) }
  public static func *  (lhs:Self, rhs:Self  ) -> Self { return lhs.mul( rhs) }
  public static func *  (lhs:Self, rhs:Scalar) -> Self { return lhs.mul( rhs) }
  public static func *= (lhs:Self, rhs:Self  )         { return lhs.mul_(rhs) }
  public static func *= (lhs:Self, rhs:Scalar)         { return lhs.mul_(rhs) }
  public static func /  (lhs:Self, rhs:Self  ) -> Self { return lhs.div( rhs) }
  public static func /  (lhs:Self, rhs:Scalar) -> Self { return lhs.div( rhs) }
  public static func /= (lhs:Self, rhs:Self  )         { return lhs.div_(rhs) }
  public static func /= (lhs:Self, rhs:Scalar)         { return lhs.div_(rhs) }
  public static func + (lhs:Scalar, rhs:Self) -> Self { return rhs.add(lhs) }
  public static func * (lhs:Scalar, rhs:Self) -> Self { return rhs.mul(lhs) }
}
extension Vector where Scalar==Double {
  public func asum()->Scalar { return cblas_dasum(c, p, 1) }
  public func nrm2()->Scalar { return cblas_dnrm2(c, p, 1) }
  public func dot(_ b:Self)->Scalar { return cblas_ddot(c, p, 1, b.p, 1) }

    public func ln(_ dest: Self) { vdLn(c, p, dest.p) }
    public func ln_() { ln(self) }
    public func ln() -> Self  { return new_call(ln) }
    public func abs(_ dest: Self) { vdAbs(c, p, dest.p) }
    public func abs_() { abs(self) }
    public func abs() -> Self  { return new_call(abs) }
    public func inv(_ dest: Self) { vdInv(c, p, dest.p) }
    public func inv_() { inv(self) }
    public func inv() -> Self  { return new_call(inv) }
    public func sqr(_ dest: Self) { vdSqr(c, p, dest.p) }
    public func sqr_() { sqr(self) }
    public func sqr() -> Self  { return new_call(sqr) }
    public func exp(_ dest: Self) { vdExp(c, p, dest.p) }
    public func exp_() { exp(self) }
    public func exp() -> Self  { return new_call(exp) }
    public func cos(_ dest: Self) { vdCos(c, p, dest.p) }
    public func cos_() { cos(self) }
    public func cos() -> Self  { return new_call(cos) }
    public func sin(_ dest: Self) { vdSin(c, p, dest.p) }
    public func sin_() { sin(self) }
    public func sin() -> Self  { return new_call(sin) }
    public func tan(_ dest: Self) { vdTan(c, p, dest.p) }
    public func tan_() { tan(self) }
    public func tan() -> Self  { return new_call(tan) }
    public func erf(_ dest: Self) { vdErf(c, p, dest.p) }
    public func erf_() { erf(self) }
    public func erf() -> Self  { return new_call(erf) }
    public func sqrt(_ dest: Self) { vdSqrt(c, p, dest.p) }
    public func sqrt_() { sqrt(self) }
    public func sqrt() -> Self  { return new_call(sqrt) }
    public func cbrt(_ dest: Self) { vdCbrt(c, p, dest.p) }
    public func cbrt_() { cbrt(self) }
    public func cbrt() -> Self  { return new_call(cbrt) }
    public func cosh(_ dest: Self) { vdCosh(c, p, dest.p) }
    public func cosh_() { cosh(self) }
    public func cosh() -> Self  { return new_call(cosh) }
    public func sinh(_ dest: Self) { vdSinh(c, p, dest.p) }
    public func sinh_() { sinh(self) }
    public func sinh() -> Self  { return new_call(sinh) }
    public func tanh(_ dest: Self) { vdTanh(c, p, dest.p) }
    public func tanh_() { tanh(self) }
    public func tanh() -> Self  { return new_call(tanh) }
    public func acos(_ dest: Self) { vdAcos(c, p, dest.p) }
    public func acos_() { acos(self) }
    public func acos() -> Self  { return new_call(acos) }
    public func asin(_ dest: Self) { vdAsin(c, p, dest.p) }
    public func asin_() { asin(self) }
    public func asin() -> Self  { return new_call(asin) }
    public func atan(_ dest: Self) { vdAtan(c, p, dest.p) }
    public func atan_() { atan(self) }
    public func atan() -> Self  { return new_call(atan) }
    public func erfc(_ dest: Self) { vdErfc(c, p, dest.p) }
    public func erfc_() { erfc(self) }
    public func erfc() -> Self  { return new_call(erfc) }
    public func ceil(_ dest: Self) { vdCeil(c, p, dest.p) }
    public func ceil_() { ceil(self) }
    public func ceil() -> Self  { return new_call(ceil) }
    public func rint(_ dest: Self) { vdRint(c, p, dest.p) }
    public func rint_() { rint(self) }
    public func rint() -> Self  { return new_call(rint) }
    public func expm1(_ dest: Self) { vdExpm1(c, p, dest.p) }
    public func expm1_() { expm1(self) }
    public func expm1() -> Self  { return new_call(expm1) }
    public func log10(_ dest: Self) { vdLog10(c, p, dest.p) }
    public func log10_() { log10(self) }
    public func log10() -> Self  { return new_call(log10) }
    public func log1p(_ dest: Self) { vdLog1p(c, p, dest.p) }
    public func log1p_() { log1p(self) }
    public func log1p() -> Self  { return new_call(log1p) }
    public func acosh(_ dest: Self) { vdAcosh(c, p, dest.p) }
    public func acosh_() { acosh(self) }
    public func acosh() -> Self  { return new_call(acosh) }
    public func asinh(_ dest: Self) { vdAsinh(c, p, dest.p) }
    public func asinh_() { asinh(self) }
    public func asinh() -> Self  { return new_call(asinh) }
    public func atanh(_ dest: Self) { vdAtanh(c, p, dest.p) }
    public func atanh_() { atanh(self) }
    public func atanh() -> Self  { return new_call(atanh) }
    public func floor(_ dest: Self) { vdFloor(c, p, dest.p) }
    public func floor_() { floor(self) }
    public func floor() -> Self  { return new_call(floor) }
    public func round(_ dest: Self) { vdRound(c, p, dest.p) }
    public func round_() { round(self) }
    public func round() -> Self  { return new_call(round) }
    public func trunc(_ dest: Self) { vdTrunc(c, p, dest.p) }
    public func trunc_() { trunc(self) }
    public func trunc() -> Self  { return new_call(trunc) }
    public func erfInv(_ dest: Self) { vdErfInv(c, p, dest.p) }
    public func erfInv_() { erfInv(self) }
    public func erfInv() -> Self  { return new_call(erfInv) }
    public func pow3o2(_ dest: Self) { vdPow3o2(c, p, dest.p) }
    public func pow3o2_() { pow3o2(self) }
    public func pow3o2() -> Self  { return new_call(pow3o2) }
    public func pow2o3(_ dest: Self) { vdPow2o3(c, p, dest.p) }
    public func pow2o3_() { pow2o3(self) }
    public func pow2o3() -> Self  { return new_call(pow2o3) }
    public func invSqrt(_ dest: Self) { vdInvSqrt(c, p, dest.p) }
    public func invSqrt_() { invSqrt(self) }
    public func invSqrt() -> Self  { return new_call(invSqrt) }
    public func invCbrt(_ dest: Self) { vdInvCbrt(c, p, dest.p) }
    public func invCbrt_() { invCbrt(self) }
    public func invCbrt() -> Self  { return new_call(invCbrt) }
    public func nearbyInt(_ dest: Self) { vdNearbyInt(c, p, dest.p) }
    public func nearbyInt_() { nearbyInt(self) }
    public func nearbyInt() -> Self  { return new_call(nearbyInt) }

    public func sum()->Scalar { return ipp_reduce(ippsSum_64f) }
    public func mean()->Scalar { return ipp_reduce(ippsMean_64f) }
    public func stdDev()->Scalar { return ipp_reduce(ippsStdDev_64f) }
    public func max()->Scalar { return ipp_reduce(ippsMax_64f) }
    public func min()->Scalar { return ipp_reduce(ippsMin_64f) }

  public func add(_ b:Self, _ dest:Self) { vdAdd(c, p, b.p, dest.p) }
  public func add_(_ b:Self) { add(b, self) }
  public func add(_ b:Self)->Self { return new_call(add, b) }
  public func sub(_ b:Self, _ dest:Self) { vdSub(c, p, b.p, dest.p) }
  public func sub_(_ b:Self) { sub(b, self) }
  public func sub(_ b:Self)->Self { return new_call(sub, b) }
  public func mul(_ b:Self, _ dest:Self) { vdMul(c, p, b.p, dest.p) }
  public func mul_(_ b:Self) { mul(b, self) }
  public func mul(_ b:Self)->Self { return new_call(mul, b) }
  public func div(_ b:Self, _ dest:Self) { vdDiv(c, p, b.p, dest.p) }
  public func div_(_ b:Self) { div(b, self) }
  public func div(_ b:Self)->Self { return new_call(div, b) }
  public func pow(_ b:Self, _ dest:Self) { vdPow(c, p, b.p, dest.p) }
  public func pow_(_ b:Self) { pow(b, self) }
  public func pow(_ b:Self)->Self { return new_call(pow, b) }
  public func hypot(_ b:Self, _ dest:Self) { vdHypot(c, p, b.p, dest.p) }
  public func hypot_(_ b:Self) { hypot(b, self) }
  public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  public func atan2(_ b:Self, _ dest:Self) { vdAtan2(c, p, b.p, dest.p) }
  public func atan2_(_ b:Self) { atan2(b, self) }
  public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  public func powx(_ b:Scalar, _ dest:Self) { vdPowx(c, p, b, dest.p) }
  public func powx_(_ b:Scalar) { powx(b, self) }
  public func powx(_ b:Scalar)->Self { return new_call(powx, b) }

  public func add(_ b:Scalar, _ dest:Self) { ippsAddC_64f(p, b, dest.p, c) }
  public func add_(_ b:Scalar) { add(b, self) }
  public func add(_ b:Scalar)->Self { return new_call(add, b) }
  public func sub(_ b:Scalar, _ dest:Self) { ippsSubC_64f(p, b, dest.p, c) }
  public func sub_(_ b:Scalar) { sub(b, self) }
  public func sub(_ b:Scalar)->Self { return new_call(sub, b) }
  public func mul(_ b:Scalar, _ dest:Self) { ippsMulC_64f(p, b, dest.p, c) }
  public func mul_(_ b:Scalar) { mul(b, self) }
  public func mul(_ b:Scalar)->Self { return new_call(mul, b) }
  public func div(_ b:Scalar, _ dest:Self) { ippsDivC_64f(p, b, dest.p, c) }
  public func div_(_ b:Scalar) { div(b, self) }
  public func div(_ b:Scalar)->Self { return new_call(div, b) }

  public func normDiff_Inf(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_Inf_64f(p, b.p, c, $0)})}
  public func normDiff_L1(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_L1_64f(p, b.p, c, $0)})}
  public func normDiff_L2(_ b:Self)->Scalar {return ipp_reduce({ippsNormDiff_L2_64f(p, b.p, c, $0)})}

  public static func +  (lhs:Self, rhs:Self  ) -> Self { return lhs.add( rhs) }
  public static func +  (lhs:Self, rhs:Scalar) -> Self { return lhs.add( rhs) }
  public static func += (lhs:Self, rhs:Self  )         { return lhs.add_(rhs) }
  public static func += (lhs:Self, rhs:Scalar)         { return lhs.add_(rhs) }
  public static func -  (lhs:Self, rhs:Self  ) -> Self { return lhs.sub( rhs) }
  public static func -  (lhs:Self, rhs:Scalar) -> Self { return lhs.sub( rhs) }
  public static func -= (lhs:Self, rhs:Self  )         { return lhs.sub_(rhs) }
  public static func -= (lhs:Self, rhs:Scalar)         { return lhs.sub_(rhs) }
  public static func *  (lhs:Self, rhs:Self  ) -> Self { return lhs.mul( rhs) }
  public static func *  (lhs:Self, rhs:Scalar) -> Self { return lhs.mul( rhs) }
  public static func *= (lhs:Self, rhs:Self  )         { return lhs.mul_(rhs) }
  public static func *= (lhs:Self, rhs:Scalar)         { return lhs.mul_(rhs) }
  public static func /  (lhs:Self, rhs:Self  ) -> Self { return lhs.div( rhs) }
  public static func /  (lhs:Self, rhs:Scalar) -> Self { return lhs.div( rhs) }
  public static func /= (lhs:Self, rhs:Self  )         { return lhs.div_(rhs) }
  public static func /= (lhs:Self, rhs:Scalar)         { return lhs.div_(rhs) }
  public static func + (lhs:Scalar, rhs:Self) -> Self { return rhs.add(lhs) }
  public static func * (lhs:Scalar, rhs:Self) -> Self { return rhs.mul(lhs) }
}

