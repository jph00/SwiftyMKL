import Foundation

public protocol SupportsMKL:BinaryFloatingPoint {
  init(_ value: Double)
  var doubleValue : Double { get }
}
extension Double : SupportsMKL {
  public var doubleValue : Double { return self }
}
extension Float : SupportsMKL {
  public var doubleValue : Double { return Double(self) }
}
extension SupportsMKL {
  public func min<T : SupportsMKL> (_ power: T) -> Self {
    return .init(Swift.min(doubleValue, power.doubleValue))
  }
  public func max<T : SupportsMKL> (_ power: T) -> Self {
    return .init(Swift.max(doubleValue, power.doubleValue))
  }
  public func pow<T : SupportsMKL> (_ power: T) -> Self {
    return .init(Foundation.pow(doubleValue, power.doubleValue))
  }
}

precedencegroup ExponentiationPrecedence { associativity: right higherThan: MultiplicationPrecedence }
infix operator ^^: ExponentiationPrecedence

public func ^^<T:SupportsMKL, U:SupportsMKL> (base:T, power:U) -> T {
  return base.pow(power)
}

