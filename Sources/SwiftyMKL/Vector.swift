import Foundation

public protocol Vector:
    Equatable, RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral, CustomStringConvertible
    where Scalar:SupportsMKL, Element==Scalar, Index==Int {
  associatedtype Scalar
  associatedtype Ptr
  typealias PtrT = UnsafePointer<Scalar>
  typealias MutPtrT = UnsafeMutablePointer<Scalar>

  init(_ count:Int)
  init(_ data:Array<Scalar>)

  func new(_ size:Int)  -> Self
  func copy() -> Self
  var p:MutPtrT {get}
}

extension Vector {
  // ExpressibleByArrayLiteral
  public init(arrayLiteral data: Scalar...) { self.init(data) }
  // RandomAccessCollection
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  // Equatable
  public static func ==(lhs:Self, rhs:Self) -> Bool { return lhs.elementsEqual(rhs) }
  public static func ==(lhs:Array<Element>, rhs:Self) -> Bool { return self.init(lhs) == rhs }
  public static func ==(lhs:Self, rhs:Array<Element>) -> Bool { return lhs == self.init(rhs) }

  public func new()  -> Self { return new(count) }
  public var c:Int32 {get {return numericCast(count)}}
}

extension UnsafeMutableBufferPointer: Vector, Equatable, ExpressibleByArrayLiteral, CustomStringConvertible
    where Element:SupportsMKL {
  public typealias Scalar=Element
  public typealias ArrayLiteralElement=Element
  public typealias Ptr=UnsafeMutableBufferPointer<Element>

  public init(_ data:Ptr) { self.init(mutating: UnsafeBufferPointer(data)) }

  public init(_ count:Int) {
    let sz = MemoryLayout<Element>.stride
    let raw = UnsafeMutableRawBufferPointer.allocate(byteCount: sz*count, alignment: 64)
    self.init(raw.bindMemory(to: Element.self))
  }
  public init(_ array:Array<Element>) {
    self.init(array.count)
    _ = self.initialize(from:array)
  }

  public func new(_ size:Int)->Ptr { return Ptr(size) }
  public func copy() -> Ptr { return Ptr(Array(self)) }
  public var p:MutPtrT {get {return baseAddress!}}
  public var description: String { return "A\(Array(self).description)" }
}

public typealias VectorP = UnsafeMutableBufferPointer

extension Array: Vector where Element:SupportsMKL {
  public typealias Scalar=Element
  public typealias Ptr=Array<Scalar>
  public init(_ count:Int) { self.init(repeating:0, count:count) }

  public func new(_ size:Int)->Ptr { return .init(size) }
  public func copy() -> Ptr {
    return (self as NSCopying).copy(with: nil) as! Ptr
  }
  public var p:MutPtrT {get {return UnsafeMutablePointer(mutating: self)}}
}

