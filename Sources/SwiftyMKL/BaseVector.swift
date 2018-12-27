public protocol BaseVector: ArrayProtocol where Storage==AlignedStorage<Element>, Index==Int {
  associatedtype Element

  var data:Storage {get set}
  init(_ data_:Storage)

  typealias PtrT = UnsafePointer<Element>
  typealias MutPtrT = UnsafeMutablePointer<Element>
}

extension BaseVector where Element:Equatable {
  public init(_ count:Int, alignment:Int=64) {
    self.init(Storage(count, alignment:alignment))
  }
  public init(_ array:Array<Element>, alignment:Int) {
    self.init(Storage(array, alignment:alignment))
  }
  public init(_ array:Array<Element>) {self.init(array, alignment:64)}

  public var c:Int32 {return numericCast(count)}
  public var p:MutPtrT {return data.p}
  public var alignment:Int {return data.alignment}

  //CustomStringConvertible
  public var description: String { return "V\(data.description)" }

  public static func ==(lhs:Storage, rhs:Self) -> Bool { return lhs      == rhs.data }
  public static func ==(lhs:Self, rhs:Storage) -> Bool { return lhs.data == rhs      }
  public static func ==(lhs:Array<Element>, rhs:Self) -> Bool { return lhs             == Array(rhs.data) }
  public static func ==(lhs:Self, rhs:Array<Element>) -> Bool { return Array(lhs.data) == rhs             }

  // RandomAccessCollection ; TODO: figure out how to remove this and use protocol extension's version
  public subscript(i: Int) -> Element {
    get { return data[i] }
    set { data[i] = newValue }
  }

  public func new()  -> Self { return Self(data.count,  alignment:alignment) }
  public func copy() -> Self { return Self(Array(data), alignment:alignment) }

  // Fill new vector convenience functions
  func new_call(_ f:(Self)         ->()             )->Self { let res = new(); f(res);    return res }
  func new_call(_ f:(Self, Self)   ->(), _ b:Self   )->Self { let res = new(); f(b, res); return res }
  func new_call(_ f:(Element, Self)->(), _ b:Element)->Self { let res = new(); f(b, res); return res }
}

