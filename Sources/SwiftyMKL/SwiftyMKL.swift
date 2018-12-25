import Foundation

// These 2 funcs are placeholders - actually would come from MKL
func cblas_sasum(_ c:Int32, _ d:Array<Float>, _ n:Int32)->Float { return d.reduce(0.0) {$0 + abs($1)} }
func cblas_dasum(_ c:Int32, _ d:Array<Double>, _ n:Int32)->Double { return d.reduce(0.0) {$0 + abs($1)} }

public protocol VectorBase: Equatable, ExpressibleByArrayLiteral, CustomStringConvertible,
    RandomAccessCollection, MutableCollection {
  associatedtype Scalar
  var data:Array<Scalar> {get set}
  init(_ data_:Array<Scalar>)
}

public protocol Vector: VectorBase where Scalar==Element {
  func asum()->Scalar
}

extension Vector where Scalar: FloatingPoint {
  public var count:Int {get {return data.count}}
  public var c:Int32 {get {return numericCast(count)}}

  // ExpressibleByArrayLiteral
  public init(arrayLiteral data_: Scalar...) { self.init(data_) }
  //CustomStringConvertible
  public var description: String { return "V\(data.description)" }
  // Equatable
  public static func == (lhs:Self, rhs:Self) -> Bool { return lhs.data == rhs.data }
  // RandomAccessCollection
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  // MutableCollection
  public subscript(i: Int) -> Scalar {
    get { return data[i] }
    set { data[i] = newValue }
  }
}

public struct VectorF: Vector {
  public var data:Array<Float>
  public init(_ data_:Array<Float>) {data=data_}
}

public struct VectorD: Vector {
  public var data:Array<Double>
  public init(_ data_:Array<Double>) {data=data_}
}

extension Vector where Scalar==Float {
  public func asum()->Scalar { return cblas_sasum(c, data, 1) }
}
extension Vector where Scalar==Double {
  public func asum()->Scalar { return cblas_dasum(c, data, 1) }
}

