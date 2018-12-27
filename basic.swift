import Foundation

// These 2 funcs are placeholders - actually would come from MKL
func cblas_sasum(_ c:Int32, _ d:Array<Float>, _ n:Int32)->Float { return d.reduce(0.0) {$0 + abs($1)} }
func cblas_dasum(_ c:Int32, _ d:Array<Double>, _ n:Int32)->Double { return d.reduce(0.0) {$0 + abs($1)} }

public protocol BaseVector:
    Equatable , ExpressibleByArrayLiteral , CustomStringConvertible , RandomAccessCollection
    //, MutableCollection
    where Element:Equatable { //, SubSequence==Self {
  associatedtype Element
  var data:Array<Element> {get set}
  init(_ data_:Array<Element>)

  func asum()->Element
}

public protocol Vector: BaseVector {}

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
    get {
      precondition(indices.contains(i), "out of bounds")
      return data[i]
    }
    set {
      precondition(indices.contains(i), "out of bounds")
      data[i] = newValue
    }
  }
  /*
  public subscript(bounds: Range<Int>) -> Slice<Self> {
    get {
      let res = Array(data[bounds])
      return .init(base: res, bounds: 0..<res.count)
    }
    set {
      assert(newValue.count == bounds.count)
      newValue.enumerated().forEach { self[$0] = $1 }
    }
  }
  */
}

extension Vector where Element==Float {
  public func asum()->Element { return cblas_sasum(c, data, 1) }
}
extension Vector where Element==Double {
  public func asum()->Element { return cblas_dasum(c, data, 1) }
}

public struct VectorF: Vector {
  public var data:Array<Float>
  public init(_ data_:Array<Float>) {data=data_}
}

public struct VectorD: Vector {
  public var data:Array<Double>
  public init(_ data_:Array<Double>) {data=data_}
}

let a:VectorF = VectorF(Array([1.0, 2, 3]))
print(a.asum())

