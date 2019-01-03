public protocol BaseVector: RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral 
  where Index==Int {
  init(_ data:Array<Element>)
  init(_ count:Int)

  func new(_ size:Int)->Self
  func copy()->Self
  var p:UnsafeMutablePointer<Element> {get}
}

extension BaseVector {
  public init(arrayLiteral data: Element...) { self.init(data) }
  public var indices: Range<Int> { return 0..<endIndex }
  public var startIndex: Int { return 0 }

  public func new(_ size:Int)->Self { return .init(size) }
  public func new()  -> Self { return new(count) }
  public var c:Int {get {return count}}
}

public protocol ComposedStorage {
  associatedtype Storage:MutableCollection where Storage.Index==Int
  typealias Index=Int

  var data:Storage {get set}
  var endIndex:Int {get}
  subscript(i:Int)->Storage.Element {get set}
}
extension ComposedStorage {
  public subscript(i:Int)->Storage.Element { get {return data[i]} set {data[i] = newValue} }
  public var endIndex: Int { return data.count }
}

public class AlignedStorage<T:SupportsMKL>: BaseVector, ComposedStorage {
  public typealias Element=T

  public var data:UnsafeMutableBufferPointer<T>

  public required init(_ data: UnsafeMutableBufferPointer<T>) {self.data=data}
  public required convenience init(_ count:Int) {
    let sz = MemoryLayout<T>.stride
    let raw = UnsafeMutableRawBufferPointer.allocate(byteCount: sz*count, alignment: 64)
    self.init(raw.bindMemory(to: T.self))
  }
  public required convenience init(_ array:Array<T>) {
    self.init(array.count)
    _ = data.initialize(from:array)
  }
  deinit { UnsafeMutableRawBufferPointer(data).deallocate() }

  public var p:UnsafeMutablePointer<T> {get {return data.baseAddress!}}
  public func copy()->Self { return .init(Array(data)) }
}

