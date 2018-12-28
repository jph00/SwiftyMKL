//import Foundation

// These 2 funcs are placeholders - actually would come from MKL
func cblas_sasum(_ c:Int32, _ d:Array<Float >, _ n:Int32)->Float  { return d.reduce(0.0) {$0 + abs($1)} }
func cblas_dasum(_ c:Int32, _ d:Array<Double>, _ n:Int32)->Double { return d.reduce(0.0) {$0 + abs($1)} }

public protocol Subscriptable {
  associatedtype Element
  var count:Int {get}
  subscript(i: Int)->Element {get set}
}
extension Array:                      Subscriptable {}
extension UnsafeMutableBufferPointer: Subscriptable {}

public protocol VectorBase :
    Equatable, RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral, CustomStringConvertible, Subscriptable
    where Element:Equatable, Element==Scalar {
  associatedtype Scalar
  associatedtype Storage:Subscriptable
    where Storage.Element==Scalar
  var data:Storage {get set}
  init(_ data_:Storage)
  init(_ data_:Array<Scalar>)
}

extension VectorBase {
  public var count:Int {get {return data.count}}
  public var c:Int32 {get {return numericCast(count)}}

  // ExpressibleByArrayLiteral
  public init(arrayLiteral data_: Scalar...) { self.init(data_) }
  // RandomAccessCollection
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  // MutableCollection
  public subscript(i: Int) -> Scalar {
    get { return data[i] }
    set { data[i] = newValue }
  }
  // Equatable
  public static func == (lhs:Self, rhs:Self) -> Bool { return lhs.elementsEqual(rhs) }
}

public class ArrayStorage<T:Equatable>: VectorBase {
  public typealias Scalar=T
  public var data:Array<T>
  public required init(_ data_:Array<T>) {data=data_}
  public var p:Array<T> {return data}
  public var description: String { return "A\(Array(data).description)" }
}

public protocol Vector: VectorBase where Storage==ArrayStorage<Scalar> {
  func asum()->Scalar
}

extension Vector {
  public var description: String { return "V\(Array(data).description)" }
  public init(_ data_:Array<Scalar>) {self.init(ArrayStorage<Scalar>(data_))}
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
  public func asum()->Scalar { return cblas_sasum(c, data.p, 1) }
}
extension Vector where Scalar==Double {
  public func asum()->Scalar { return cblas_dasum(c, data.p, 1) }
}

let b = ArrayStorage<Float>([1.0, 2, 4])
let a = VectorFloat(b)
print(a.asum())
print(b)
print(a)


