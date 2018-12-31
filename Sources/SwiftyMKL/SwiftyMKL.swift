import Foundation
import CMKL
import CIPP


public protocol Vector: BaseVector where Storage==ArrayStorage<Scalar>, Scalar:SupportsMKL { }

public struct VectorS<T:SupportsMKL>: Vector {
  public typealias Scalar=T
  public var data:ArrayStorage<T>
  public init(_ data_:ArrayStorage<T>) {data=data_}
}

extension Vector {
  public var p:MutPtrT {get {return data.p}}
  public var description: String { return "V\(Array(data).description)" }
  public init(_ data:Array<Scalar>) {self.init(ArrayStorage<Scalar>(data))}
  public init(_ count:Int) {self.init(ArrayStorage<Scalar>(count))}
  public var alignment:Int {return data.alignment}

  public func new(_ size:Int)  -> Self { return Self.init(ArrayStorage<Scalar>(size,  alignment:alignment)) }
  public func new()  -> Self { return new(data.count) }
  public func copy() -> Self { return Self.init(ArrayStorage<Scalar>(Array(data), alignment:alignment)) }

  func new_call(_ f:(Self)         ->()              )->Self { let res = new(); f(      res); return res }
  func new_call(_ f:(Self, Self)   ->(), _ b:Self    )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, Self)   ->(), _ b:T       )->Self { let res = new(); f(b,    res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T)->Self { let res = new(); f(b, c, res); return res }

  func new_call<T>(_ f:(T, Self)->(), _ b:T, n:Int)->Self { let res = new(n); f(b, res); return res }
  func new_call<T>(_ f:(T, T, Self)->(), _ b:T, _ c:T, n:Int)->Self { let res = new(n); f(b, c, res); return res }

  public func asum()->Scalar { return Scalar.asum(c, p, 1) }
  public func nrm2()->Scalar { return Scalar.nrm2(c, p, 1) }
  public func dot(_ b:Self)->Scalar { return Scalar.dot(c, p, 1, b.p, 1) }
  public func set(_ b: Scalar) { Scalar.set(b, p, c) }
  public func zero() { Scalar.zero(p, c) }
  public func move(_ b:Self, _ n:Int) { Scalar.move(p, b.p, numericCast(n)) }
  public func move(_ b:Self, _ n:Int, fromIdx:Int, toIdx:Int) { _=Scalar.move(p+fromIdx, b.p+toIdx, numericCast(n)) }

  public func ln(_ dest: Self) { Scalar.ln(c, p, dest.p) }
  public func ln_() { ln(self) }
  public func ln() -> Self  { return new_call(ln) }
  public func abs(_ dest: Self) { Scalar.abs(c, p, dest.p) }
  public func abs_() { abs(self) }
  public func abs() -> Self  { return new_call(abs) }
  public func inv(_ dest: Self) { Scalar.inv(c, p, dest.p) }
  public func inv_() { inv(self) }
  public func inv() -> Self  { return new_call(inv) }
  public func sqr(_ dest: Self) { Scalar.sqr(c, p, dest.p) }
  public func sqr_() { sqr(self) }
  public func sqr() -> Self  { return new_call(sqr) }
  public func exp(_ dest: Self) { Scalar.exp(c, p, dest.p) }
  public func exp_() { exp(self) }
  public func exp() -> Self  { return new_call(exp) }
  public func cos(_ dest: Self) { Scalar.cos(c, p, dest.p) }
  public func cos_() { cos(self) }
  public func cos() -> Self  { return new_call(cos) }
  public func sin(_ dest: Self) { Scalar.sin(c, p, dest.p) }
  public func sin_() { sin(self) }
  public func sin() -> Self  { return new_call(sin) }
  public func tan(_ dest: Self) { Scalar.tan(c, p, dest.p) }
  public func tan_() { tan(self) }
  public func tan() -> Self  { return new_call(tan) }
  public func erf(_ dest: Self) { Scalar.erf(c, p, dest.p) }
  public func erf_() { erf(self) }
  public func erf() -> Self  { return new_call(erf) }
  public func sqrt(_ dest: Self) { Scalar.sqrt(c, p, dest.p) }
  public func sqrt_() { sqrt(self) }
  public func sqrt() -> Self  { return new_call(sqrt) }
  public func cbrt(_ dest: Self) { Scalar.cbrt(c, p, dest.p) }
  public func cbrt_() { cbrt(self) }
  public func cbrt() -> Self  { return new_call(cbrt) }
  public func cosh(_ dest: Self) { Scalar.cosh(c, p, dest.p) }
  public func cosh_() { cosh(self) }
  public func cosh() -> Self  { return new_call(cosh) }
  public func sinh(_ dest: Self) { Scalar.sinh(c, p, dest.p) }
  public func sinh_() { sinh(self) }
  public func sinh() -> Self  { return new_call(sinh) }
  public func tanh(_ dest: Self) { Scalar.tanh(c, p, dest.p) }
  public func tanh_() { tanh(self) }
  public func tanh() -> Self  { return new_call(tanh) }
  public func acos(_ dest: Self) { Scalar.acos(c, p, dest.p) }
  public func acos_() { acos(self) }
  public func acos() -> Self  { return new_call(acos) }
  public func asin(_ dest: Self) { Scalar.asin(c, p, dest.p) }
  public func asin_() { asin(self) }
  public func asin() -> Self  { return new_call(asin) }
  public func atan(_ dest: Self) { Scalar.atan(c, p, dest.p) }
  public func atan_() { atan(self) }
  public func atan() -> Self  { return new_call(atan) }
  public func erfc(_ dest: Self) { Scalar.erfc(c, p, dest.p) }
  public func erfc_() { erfc(self) }
  public func erfc() -> Self  { return new_call(erfc) }
  public func ceil(_ dest: Self) { Scalar.ceil(c, p, dest.p) }
  public func ceil_() { ceil(self) }
  public func ceil() -> Self  { return new_call(ceil) }
  public func rint(_ dest: Self) { Scalar.rint(c, p, dest.p) }
  public func rint_() { rint(self) }
  public func rint() -> Self  { return new_call(rint) }
  public func expm1(_ dest: Self) { Scalar.expm1(c, p, dest.p) }
  public func expm1_() { expm1(self) }
  public func expm1() -> Self  { return new_call(expm1) }
  public func log10(_ dest: Self) { Scalar.log10(c, p, dest.p) }
  public func log10_() { log10(self) }
  public func log10() -> Self  { return new_call(log10) }
  public func log1p(_ dest: Self) { Scalar.log1p(c, p, dest.p) }
  public func log1p_() { log1p(self) }
  public func log1p() -> Self  { return new_call(log1p) }
  public func acosh(_ dest: Self) { Scalar.acosh(c, p, dest.p) }
  public func acosh_() { acosh(self) }
  public func acosh() -> Self  { return new_call(acosh) }
  public func asinh(_ dest: Self) { Scalar.asinh(c, p, dest.p) }
  public func asinh_() { asinh(self) }
  public func asinh() -> Self  { return new_call(asinh) }
  public func atanh(_ dest: Self) { Scalar.atanh(c, p, dest.p) }
  public func atanh_() { atanh(self) }
  public func atanh() -> Self  { return new_call(atanh) }
  public func floor(_ dest: Self) { Scalar.floor(c, p, dest.p) }
  public func floor_() { floor(self) }
  public func floor() -> Self  { return new_call(floor) }
  public func round(_ dest: Self) { Scalar.round(c, p, dest.p) }
  public func round_() { round(self) }
  public func round() -> Self  { return new_call(round) }
  public func trunc(_ dest: Self) { Scalar.trunc(c, p, dest.p) }
  public func trunc_() { trunc(self) }
  public func trunc() -> Self  { return new_call(trunc) }
  public func erfInv(_ dest: Self) { Scalar.erfInv(c, p, dest.p) }
  public func erfInv_() { erfInv(self) }
  public func erfInv() -> Self  { return new_call(erfInv) }
  public func pow3o2(_ dest: Self) { Scalar.pow3o2(c, p, dest.p) }
  public func pow3o2_() { pow3o2(self) }
  public func pow3o2() -> Self  { return new_call(pow3o2) }
  public func pow2o3(_ dest: Self) { Scalar.pow2o3(c, p, dest.p) }
  public func pow2o3_() { pow2o3(self) }
  public func pow2o3() -> Self  { return new_call(pow2o3) }
  public func invSqrt(_ dest: Self) { Scalar.invSqrt(c, p, dest.p) }
  public func invSqrt_() { invSqrt(self) }
  public func invSqrt() -> Self  { return new_call(invSqrt) }
  public func invCbrt(_ dest: Self) { Scalar.invCbrt(c, p, dest.p) }
  public func invCbrt_() { invCbrt(self) }
  public func invCbrt() -> Self  { return new_call(invCbrt) }
  public func nearbyInt(_ dest: Self) { Scalar.nearbyInt(c, p, dest.p) }
  public func nearbyInt_() { nearbyInt(self) }
  public func nearbyInt() -> Self  { return new_call(nearbyInt) }

  public func add(_ b:Self, _ dest:Self) { Scalar.add(c, p, b.p, dest.p) }
  public func add_(_ b:Self) { add(b, self) }
  public func add(_ b:Self)->Self { return new_call(add, b) }
  public func sub(_ b:Self, _ dest:Self) { Scalar.sub(c, p, b.p, dest.p) }
  public func sub_(_ b:Self) { sub(b, self) }
  public func sub(_ b:Self)->Self { return new_call(sub, b) }
  public func mul(_ b:Self, _ dest:Self) { Scalar.mul(c, p, b.p, dest.p) }
  public func mul_(_ b:Self) { mul(b, self) }
  public func mul(_ b:Self)->Self { return new_call(mul, b) }
  public func div(_ b:Self, _ dest:Self) { Scalar.div(c, p, b.p, dest.p) }
  public func div_(_ b:Self) { div(b, self) }
  public func div(_ b:Self)->Self { return new_call(div, b) }
  public func pow(_ b:Self, _ dest:Self) { Scalar.pow(c, p, b.p, dest.p) }
  public func pow_(_ b:Self) { pow(b, self) }
  public func pow(_ b:Self)->Self { return new_call(pow, b) }
  public func hypot(_ b:Self, _ dest:Self) { Scalar.hypot(c, p, b.p, dest.p) }
  public func hypot_(_ b:Self) { hypot(b, self) }
  public func hypot(_ b:Self)->Self { return new_call(hypot, b) }
  public func atan2(_ b:Self, _ dest:Self) { Scalar.atan2(c, p, b.p, dest.p) }
  public func atan2_(_ b:Self) { atan2(b, self) }
  public func atan2(_ b:Self)->Self { return new_call(atan2, b) }

  public func addC(_ b:Scalar, _ dest:Self) { Scalar.addC(p, b, dest.p, c) }
  public func addC_(_ b:Scalar) { addC(b, self) }
  public func addC(_ b:Scalar)->Self { return new_call(addC, b) }
  public func subC(_ b:Scalar, _ dest:Self) { Scalar.subC(p, b, dest.p, c) }
  public func subC_(_ b:Scalar) { subC(b, self) }
  public func subC(_ b:Scalar)->Self { return new_call(subC, b) }
  public func mulC(_ b:Scalar, _ dest:Self) { Scalar.mulC(p, b, dest.p, c) }
  public func mulC_(_ b:Scalar) { mulC(b, self) }
  public func mulC(_ b:Scalar)->Self { return new_call(mulC, b) }
  public func divC(_ b:Scalar, _ dest:Self) { Scalar.divC(p, b, dest.p, c) }
  public func divC_(_ b:Scalar) { divC(b, self) }
  public func divC(_ b:Scalar)->Self { return new_call(divC, b) }

  // IPP convenience functions
  typealias ippFuncReduce = (PtrT,Int32,MutPtrT)->()
  func ipp_reduce(_ f:(MutPtrT)->())->Scalar { var res:Scalar=Scalar.init(); f(&res); return res }
  func ipp_reduce(_ f:ippFuncReduce)->Scalar { return ipp_reduce({f(p, c, $0)}) }

  public func sum()->Scalar { return ipp_reduce(Scalar.sum) }
  public func mean()->Scalar { return ipp_reduce(Scalar.mean) }
  public func stdDev()->Scalar { return ipp_reduce(Scalar.stdDev) }
  public func max()->Scalar { return ipp_reduce(Scalar.max) }
  public func min()->Scalar { return ipp_reduce(Scalar.min) }

  public func normDiff_Inf(_ b:Self)->Scalar {return ipp_reduce({Scalar.normDiff_Inf(p, b.p, c, $0)})}
  public func normDiff_L1(_ b:Self)->Scalar {return ipp_reduce({Scalar.normDiff_L1(p, b.p, c, $0)})}
  public func normDiff_L2(_ b:Self)->Scalar {return ipp_reduce({Scalar.normDiff_L2(p, b.p, c, $0)})}

  public func powx(_ b:Scalar, _ dest:Self) { Scalar.powx(c, p, b, dest.p) }
  public func powx_(_ b:Scalar) { powx(b, self) }
  public func powx(_ b:Scalar)->Self { return new_call(powx, b) }

  public static func +  (lhs:Self, rhs:Self  ) -> Self { return lhs.add( rhs) }
  public static func +  (lhs:Self, rhs:Scalar) -> Self { return lhs.addC( rhs) }
  public static func += (lhs:Self, rhs:Self  )         { return lhs.add_(rhs) }
  public static func += (lhs:Self, rhs:Scalar)         { return lhs.addC_(rhs) }
  public static func -  (lhs:Self, rhs:Self  ) -> Self { return lhs.sub( rhs) }
  public static func -  (lhs:Self, rhs:Scalar) -> Self { return lhs.subC( rhs) }
  public static func -= (lhs:Self, rhs:Self  )         { return lhs.sub_(rhs) }
  public static func -= (lhs:Self, rhs:Scalar)         { return lhs.subC_(rhs) }
  public static func *  (lhs:Self, rhs:Self  ) -> Self { return lhs.mul( rhs) }
  public static func *  (lhs:Self, rhs:Scalar) -> Self { return lhs.mulC( rhs) }
  public static func *= (lhs:Self, rhs:Self  )         { return lhs.mul_(rhs) }
  public static func *= (lhs:Self, rhs:Scalar)         { return lhs.mulC_(rhs) }
  public static func /  (lhs:Self, rhs:Self  ) -> Self { return lhs.div( rhs) }
  public static func /  (lhs:Self, rhs:Scalar) -> Self { return lhs.divC( rhs) }
  public static func /= (lhs:Self, rhs:Self  )         { return lhs.div_(rhs) }
  public static func /= (lhs:Self, rhs:Scalar)         { return lhs.divC_(rhs) }
  public static func + (lhs:Scalar, rhs:Self) -> Self { return rhs.addC(lhs) }
  public static func * (lhs:Scalar, rhs:Self) -> Self { return rhs.mulC(lhs) }

  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int, _ dest:Self) { Scalar.packI(numericCast(n), p+from, numericCast(incr), dest.p) }
  public func packIncrement(_ incr:Int, _ from:Int, _ n:Int)->Self {
    let res = new(n); packIncrement(incr, from, n, res); return res
  }
  public func packIndices(_ idxs:[Int32], _ dest:Self) { Scalar.packV(numericCast(idxs.count), p, idxs, dest.p) }
  public func packIndices(_ idxs:[Int32])->Self { return new_call(packIndices, idxs, n:idxs.count) }
  public func packMasked(_ mask:[Int32], _ dest:Self) { Scalar.packM(c, p, mask, dest.p) }
  public func packMasked(_ mask:[Int32])->Self { return new_call(packMasked, mask, n:Int(mask.reduce(0,+))) }
}

