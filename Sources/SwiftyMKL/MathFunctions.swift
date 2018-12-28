import Foundation


public protocol SupportsMKL:BinaryFloatingPoint {
  init(_ value: Double)
  var doubleValue : Double { get }
  func pow(_ b: Self) -> Self
  func min(_ b: Self) -> Self
  func max(_ b: Self) -> Self
}

extension Float : SupportsMKL {
  public var doubleValue : Double { return Double(self) }

  public func pow(_ b: Float) -> Float {return Foundation.pow(self, b)}
  public func min(_ b: Float) -> Float {return Swift.min(self, b)}
  public func max(_ b: Float) -> Float {return Swift.max(self, b)}
}
extension Double : SupportsMKL {
  public var doubleValue : Double { return Double(self) }

  public func pow(_ b: Double) -> Double {return Foundation.pow(self, b)}
  public func min(_ b: Double) -> Double {return Swift.min(self, b)}
  public func max(_ b: Double) -> Double {return Swift.max(self, b)}
}

precedencegroup ExponentiationPrecedence { associativity: right higherThan: MultiplicationPrecedence }
infix operator ^^: ExponentiationPrecedence

public func ^^<T:SupportsMKL> (base:T, power:T) -> T {
  return base.pow(power)
}

