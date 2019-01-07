import Foundation
import BaseMath

public protocol Vector: BaseVector, Equatable, CustomStringConvertible where Element:SupportsMKL { }

extension Vector {
  public static func ==(lhs:Self, rhs:Self) -> Bool { return lhs.elementsEqual(rhs) }
  public static func ==(lhs:Array<Element>, rhs:Self) -> Bool { return self.init(lhs) == rhs }
  public static func ==(lhs:Self, rhs:Array<Element>) -> Bool { return lhs == self.init(rhs) }
}

public struct VectorP<T:SupportsMKL>: Vector, ComposedStorage {
  public typealias Element=T

  public var data:AlignedStorage<T>
  public init(_ data:AlignedStorage<T>) { self.data = data }
  public init(_ data:UnsafeMutableBufferPointer<T>) { self.init(AlignedStorage(data)) }

  public init(_ count:Int) { self.init(AlignedStorage(count)) }
  public init(_ array:Array<T>) { self.init(AlignedStorage(array)) }

  public var p:MutPtrT {get {return data.p}}
  public func copy() -> VectorP { return .init(data.copy()) }

  public var description: String { return "A\(Array(self).description)" }
}

extension Array: Vector where Element:SupportsMKL { }

