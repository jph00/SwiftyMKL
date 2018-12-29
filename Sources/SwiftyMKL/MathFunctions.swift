import Foundation


public protocol SupportsMKL:BinaryFloatingPoint {
  init(_ value: CGFloat)
  init()
  var cgfloat : CGFloat {get}
  static var zero:Self {get}
  static var one:Self {get}
  static var two:Self {get}
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
}

extension Float : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }
  public static var one:Float {get {return 1}}
  public static var two:Float {get {return 2}}

  public func pow(_ b: Float) -> Float {return Foundation.pow(self, b)}
  public func min(_ b: Float) -> Float {return Swift.min(self, b)}
  public func max(_ b: Float) -> Float {return Swift.max(self, b)}
}
extension Double : SupportsMKL {
  public var cgfloat : CGFloat { return CGFloat(self) }
  public static var one:Double {get {return 1}}
  public static var two:Double {get {return 2}}

  public func pow(_ b: Double) -> Double {return Foundation.pow(self, b)}
  public func min(_ b: Double) -> Double {return Swift.min(self, b)}
  public func max(_ b: Double) -> Double {return Swift.max(self, b)}
}

extension SupportsMKL {
  public static var zero:Self {get {return .init()}}

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

