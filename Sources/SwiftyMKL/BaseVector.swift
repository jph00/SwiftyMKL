public protocol Subscriptable: Sequence {
  var count:Int {get}
  subscript(i: Int)->Element {get set}
}
extension Array:                      Subscriptable {}
extension UnsafeMutableBufferPointer: Subscriptable {}

public protocol BaseVector :
    Equatable, RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral, CustomStringConvertible, Subscriptable
    where Element:Equatable, Element==Scalar {
  associatedtype Scalar
  associatedtype Storage:Subscriptable where Storage.Element==Scalar
  var data:Storage {get set}
  init(_ data:Storage)
  init(_ data:Array<Scalar>)
}

extension BaseVector {
  public typealias PtrT = UnsafePointer<Scalar>
  public typealias MutPtrT = UnsafeMutablePointer<Scalar>

  public var count:Int {get {return data.count}}
  public var c:Int32 {get {return numericCast(count)}}

  // ExpressibleByArrayLiteral
  public init(arrayLiteral data: Scalar...) { self.init(data) }
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
  public static func ==(lhs:Self, rhs:Self) -> Bool { return lhs.elementsEqual(rhs) }

  public static func ==(lhs:Storage, rhs:Self) -> Bool { return lhs.elementsEqual     (rhs.data) }
  public static func ==(lhs:Self, rhs:Storage) -> Bool { return lhs.data.elementsEqual(rhs     ) }

  public static func ==(lhs:Array<Element>, rhs:Self) -> Bool { return lhs             == Array(rhs.data) }
  public static func ==(lhs:Self, rhs:Array<Element>) -> Bool { return Array(lhs.data) == rhs             }
}

