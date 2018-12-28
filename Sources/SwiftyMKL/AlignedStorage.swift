public class ArrayStorage<T:Equatable>: BaseVector {
  public typealias Scalar=T

  public var data:UnsafeMutableBufferPointer<T>
  public var alignment:Int

  public required convenience init(_ data:UnsafeMutableBufferPointer<T>) {self.init(data, alignment:64)}
  public required convenience init(_ array:Array<T>) {self.init(array, alignment:64)}

  public init(_ data:UnsafeMutableBufferPointer<T>, alignment:Int) {
    (self.data,self.alignment) = (data,alignment)
  }

  public convenience init(_ count:Int, alignment:Int=64) {
    let sz = MemoryLayout<T>.stride
    let raw = UnsafeMutableRawBufferPointer.allocate(byteCount: sz*count, alignment: alignment)
    self.init(raw.bindMemory(to: T.self), alignment:alignment)
  }
  public convenience init(_ array:Array<T>, alignment:Int) {
    self.init(array.count, alignment:alignment)
    let _ = data.initialize(from:array)
  }

  deinit {UnsafeMutableRawBufferPointer(data).deallocate()}

  public var description: String { return "A\(Array(data).description)" }
  public var p:MutPtrT {get {return data.baseAddress!}}
}


