// This file shows a minimal sketch of how the main pieces fit together.
// None of this file is actually used in the library. It's just here to make it easier to see what's going on
//   and try different ideas out.

// These 2 funcs are placeholders - actually would come from MKL
func cblas_sasum(_ c:Int32, _ d:Array<Float >, _ n:Int32)->Float  { return d.reduce(0.0) {$0 + abs($1)} }
func cblas_dasum(_ c:Int32, _ d:Array<Double>, _ n:Int32)->Double { return d.reduce(0.0) {$0 + abs($1)} }

public protocol VectorBase :
    RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral where Element==Scalar {
  associatedtype Scalar
  associatedtype Storage:MutableCollection where Storage.Element==Scalar, Storage.Index==Int
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
}

// float   sasum(const MKL_INT *n, const float *x, const MKL_INT *incx);
public protocol SupportsMKL:BinaryFloatingPoint { 
  typealias T=Self
  static func asum(_ n:Int32, _ x:Array<Self>, _ incx:Int32)->Self
}
extension Double:SupportsMKL {
  public static func asum(_ n:Int32, _ x:Array<T>, _ incx:Int32)->T { return cblas_dasum(n,x,incx) }
}
extension Float:SupportsMKL {
  public static func asum(_ n:Int32, _ x:Array<T>, _ incx:Int32)->T { return cblas_sasum(n,x,incx) }
}

public class ArrayStorage<T:SupportsMKL>: VectorBase {
  public typealias Scalar=T
  public var data:Array<T>
  public required init(_ data_:Array<T>) {data=data_}
  public var p:Array<T> {return data}
}

public protocol VectorProtocol: VectorBase
  where Storage==ArrayStorage<Scalar>, Scalar:SupportsMKL { 
}

//public static func asum(_ a:ArrayStorage<Double>)->Double { return cblas_dasum(a.c, a.p, 1) }
extension VectorProtocol {
  public init(_ data_:Array<Scalar>) {self.init(ArrayStorage<Scalar>(data_))}
  public var p:Array<Scalar> {return data.p}
  func asum()->Scalar  { return Scalar.asum(c, p, 1) }
}

public struct Vector<Scalar:SupportsMKL>: VectorProtocol {
  public var data:ArrayStorage<Scalar>
  public init(_ data_:ArrayStorage<Scalar>) {data=data_}
}

let a:Vector<Float> = [1.0, 2, 4]
print(a.asum())

protocol P {
  associatedtype T:VectorProtocol
  var v:T {get}
  func f()
}
extension P {
  public func f() {
    print(v.asum())
  }
}
struct F:P {
  let v:Vector<Float> = [1.0,2]
}
let b = F()
b.f()

