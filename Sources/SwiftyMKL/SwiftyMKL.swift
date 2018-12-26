// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 1)
import Foundation
import CMKL

// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 12)

public protocol Vector: Equatable, ExpressibleByArrayLiteral, CustomStringConvertible,
    RandomAccessCollection, MutableCollection where Element:SignedNumeric {
  associatedtype Element
  var data:Array<Element> {get set}
  init(_ data_:Array<Element>)

  func asum()->Element
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func ln(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func abs(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func inv(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func sqr(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func exp(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func cos(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func sin(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func tan(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func erf(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func sqrt(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func cbrt(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func cosh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func sinh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func tanh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func acos(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func asin(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func atan(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func erfc(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func ceil(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func rint(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func expm1(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func log10(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func log1p(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func acosh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func asinh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func atanh(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func floor(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func round(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func trunc(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func erfInv(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func pow3o2(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func pow2o3(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func invSqrt(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func invCbrt(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 21)
  func nearbyInt(_ dest: inout Self)
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 23)
}

extension Vector {
  public var count:Int {get {return data.count}}
  public var c:Int32 {get {return numericCast(count)}}

  // ExpressibleByArrayLiteral
  public init(arrayLiteral data_: Element...) { self.init(data_) }
  //CustomStringConvertible
  public var description: String { return "V\(data.description)" }
  // Equatable
  public static func ==(lhs:Self,           rhs:Self) -> Bool { return lhs.data == rhs.data }
  public static func ==(lhs:Array<Element>, rhs:Self) -> Bool { return lhs      == rhs.data }
  public static func ==(lhs:Self, rhs:Array<Element>) -> Bool { return lhs.data == rhs      }
  // RandomAccessCollection
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  // MutableCollection
  public subscript(i: Int) -> Element {
    get { return data[i] }
    set { data[i] = newValue }
  }
}

// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 49)
extension Vector where Element==Float {
  public func asum()->Element { return cblas_sasum(c, data, 1) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func ln(_ dest: inout Self) { vsLn(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func abs(_ dest: inout Self) { vsAbs(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func inv(_ dest: inout Self) { vsInv(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sqr(_ dest: inout Self) { vsSqr(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func exp(_ dest: inout Self) { vsExp(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cos(_ dest: inout Self) { vsCos(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sin(_ dest: inout Self) { vsSin(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func tan(_ dest: inout Self) { vsTan(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erf(_ dest: inout Self) { vsErf(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sqrt(_ dest: inout Self) { vsSqrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cbrt(_ dest: inout Self) { vsCbrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cosh(_ dest: inout Self) { vsCosh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sinh(_ dest: inout Self) { vsSinh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func tanh(_ dest: inout Self) { vsTanh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func acos(_ dest: inout Self) { vsAcos(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func asin(_ dest: inout Self) { vsAsin(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func atan(_ dest: inout Self) { vsAtan(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erfc(_ dest: inout Self) { vsErfc(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func ceil(_ dest: inout Self) { vsCeil(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func rint(_ dest: inout Self) { vsRint(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func expm1(_ dest: inout Self) { vsExpm1(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func log10(_ dest: inout Self) { vsLog10(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func log1p(_ dest: inout Self) { vsLog1p(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func acosh(_ dest: inout Self) { vsAcosh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func asinh(_ dest: inout Self) { vsAsinh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func atanh(_ dest: inout Self) { vsAtanh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func floor(_ dest: inout Self) { vsFloor(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func round(_ dest: inout Self) { vsRound(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func trunc(_ dest: inout Self) { vsTrunc(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erfInv(_ dest: inout Self) { vsErfInv(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func pow3o2(_ dest: inout Self) { vsPow3o2(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func pow2o3(_ dest: inout Self) { vsPow2o3(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func invSqrt(_ dest: inout Self) { vsInvSqrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func invCbrt(_ dest: inout Self) { vsInvCbrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func nearbyInt(_ dest: inout Self) { vsNearbyInt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 54)
}

public struct VectorFloat: Vector {
  public var data:Array<Float>
  public init(_ data_:Array<Float>) {data=data_}
}
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 49)
extension Vector where Element==Double {
  public func asum()->Element { return cblas_dasum(c, data, 1) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func ln(_ dest: inout Self) { vdLn(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func abs(_ dest: inout Self) { vdAbs(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func inv(_ dest: inout Self) { vdInv(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sqr(_ dest: inout Self) { vdSqr(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func exp(_ dest: inout Self) { vdExp(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cos(_ dest: inout Self) { vdCos(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sin(_ dest: inout Self) { vdSin(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func tan(_ dest: inout Self) { vdTan(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erf(_ dest: inout Self) { vdErf(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sqrt(_ dest: inout Self) { vdSqrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cbrt(_ dest: inout Self) { vdCbrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func cosh(_ dest: inout Self) { vdCosh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func sinh(_ dest: inout Self) { vdSinh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func tanh(_ dest: inout Self) { vdTanh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func acos(_ dest: inout Self) { vdAcos(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func asin(_ dest: inout Self) { vdAsin(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func atan(_ dest: inout Self) { vdAtan(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erfc(_ dest: inout Self) { vdErfc(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func ceil(_ dest: inout Self) { vdCeil(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func rint(_ dest: inout Self) { vdRint(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func expm1(_ dest: inout Self) { vdExpm1(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func log10(_ dest: inout Self) { vdLog10(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func log1p(_ dest: inout Self) { vdLog1p(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func acosh(_ dest: inout Self) { vdAcosh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func asinh(_ dest: inout Self) { vdAsinh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func atanh(_ dest: inout Self) { vdAtanh(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func floor(_ dest: inout Self) { vdFloor(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func round(_ dest: inout Self) { vdRound(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func trunc(_ dest: inout Self) { vdTrunc(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func erfInv(_ dest: inout Self) { vdErfInv(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func pow3o2(_ dest: inout Self) { vdPow3o2(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func pow2o3(_ dest: inout Self) { vdPow2o3(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func invSqrt(_ dest: inout Self) { vdInvSqrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func invCbrt(_ dest: inout Self) { vdInvCbrt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 52)
    public func nearbyInt(_ dest: inout Self) { vdNearbyInt(c, data, &dest.data) }
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 54)
}

public struct VectorDouble: Vector {
  public var data:Array<Double>
  public init(_ data_:Array<Double>) {data=data_}
}
// ###sourceLocation(file: "/home/jhoward/swift/jh/SwiftyMKL2/Sources/SwiftyMKL/SwiftyMKL.swift.gyb", line: 61)

/*
let a:VectorS<Float> = [1.0, 2, 3]
print(a.asum())
*/

