import Foundation
import BaseMath

public protocol Vector: BaseVector, CustomStringConvertible where Element:SupportsMKL { }

extension Vector { }

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

