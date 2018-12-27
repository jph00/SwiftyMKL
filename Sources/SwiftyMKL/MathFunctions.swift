import Foundation

precedencegroup ExponentiationPrecedence { associativity: right higherThan: MultiplicationPrecedence }
infix operator ^^: ExponentiationPrecedence

protocol SupportsMKL:BinaryFloatingPoint {
    init(_ value: Double)
    var doubleValue : Double { get }
}
extension Double : SupportsMKL {
    var doubleValue : Double { return self }
}
extension Float : SupportsMKL {
    var doubleValue : Double { return Double(self) }
}
func ^^<T : SupportsMKL, U:SupportsMKL> (base: T, power: U) -> T {
    return T(pow(base.doubleValue, power.doubleValue))
}

