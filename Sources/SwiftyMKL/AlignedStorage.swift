extension UnsafeMutableBufferPointer {
  public var c:Int32 {get {return numericCast(count)}}
  public var p:UnsafeMutablePointer<Element> {get {return baseAddress!}}
}

public protocol Subscriptable {
  associatedtype Element
  var count:Int {get}
  subscript(i: Int)->Element {get set}
}
extension Array:                      Subscriptable {}
extension UnsafeMutableBufferPointer: Subscriptable {}

public protocol ArrayProtocol:
    RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral, Equatable, CustomStringConvertible, Subscriptable
    where Element:Equatable, Element==Storage.Element {
  associatedtype Storage: Subscriptable
  init(_ array:Array<Element>)
  var data:Storage {get set}
}

extension ArrayProtocol {
  public var indices: Range<Int> { return 0..<count }
  public var startIndex: Int { return 0 }
  public var endIndex: Int { return count }
  public static func == (lhs:Self, rhs:Self) -> Bool { return lhs.elementsEqual(rhs) }
  public init(arrayLiteral data_: Element...) { self.init(data_) }
  public var count:Int {get {return data.count}}
  public subscript(i: Int) -> Element {
    get { return data[i] }
    set { data[i] = newValue }
  }
}

public class AlignedStorage<Element:Equatable>: ArrayProtocol {
  public var data:UnsafeMutableBufferPointer<Element>
  public var alignment:Int

  public init(_ count:Int, alignment:Int=64) {
    let sz = MemoryLayout<Element>.stride
    let raw = UnsafeMutableRawBufferPointer.allocate(byteCount: sz*count, alignment: alignment)
    self.alignment = alignment
    data = raw.bindMemory(to: Element.self)
  }
  public convenience init(_ array:Array<Element>, alignment:Int) {
    self.init(array.count, alignment:alignment)
    let _ = data.initialize(from:array)
  }
  public required convenience init(_ array:Array<Element>) {self.init(array, alignment:64)}

  deinit {UnsafeMutableRawBufferPointer(data).deallocate()}

  public var description: String { return "A\(Array(data).description)" }
  public var p:UnsafeMutablePointer<Element> {get {return data.p}}
}


