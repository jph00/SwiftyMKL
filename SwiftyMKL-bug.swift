//import Foundation

// These 2 funcs are placeholders - actually would come from MKL
func cblas_sasum(_ c:Int32, _ d:Array<Float>, _ n:Int32)->Float {
  return d.reduce(0.0) {$0 + abs($1)}
}
func cblas_dasum(_ c:Int32, _ d:Array<Double>, _ n:Int32)->Double {
  return d.reduce(0.0) {$0 + abs($1)}
}

public protocol VectorBase : Equatable, CustomStringConvertible, ExpressibleByArrayLiteral,
    RandomAccessCollection, MutableCollection where Index==Int, E==Element {
  associatedtype E
  var data:Array<E> {get set}
  init(_ data_:Array<E>)
}

public protocol Vector: VectorBase {
  func asum()->E
}

extension Vector where E: FloatingPoint {
  public var count:Int {get {return data.count}}
  public var c:Int32 {get {return numericCast(count)}}

  // ExpressibleByArrayLiteral
  public init(arrayLiteral data_: Element...) { self.init(data_) }
  //CustomStringConvertible
  public var description: String { return "V\(data.description)" }
  // Equatable
  public static func == (lhs:Self, rhs:Self) -> Bool { return lhs.data == rhs.data }
  // RandomAccessCollection
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  // MutableCollection
  public subscript(i: Index) -> E {
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

extension Vector where E==Float {
  public func asum()->E { return cblas_sasum(c, data, 1) }
}
extension Vector where E==Double {
  public func asum()->E { return cblas_dasum(c, data, 1) }
}

let a:VectorF = [1.0, 2, 3]
print(a.asum())

