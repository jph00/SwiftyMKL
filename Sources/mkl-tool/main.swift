import Foundation
import CoreFoundation
import CSwiftyMKL
import SwiftyMKL

IPP.setup()

func benchmarkTime(f: ()->()) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<10 {f()}
    return CFAbsoluteTimeGetCurrent() - start
}

func benchmark(title:String, f:()->()) {
    let time = benchmarkTime(f:f)
    print("Time for \(title): \(time) s.")
}

public typealias E=Float
//public typealias E=Double
public typealias T = VectorP<E>
let size = 100000
var ptr = T(size)
ptr.set(1.0)
ptr[3] = -1.2
ptr[5] =  0.2
var ptr2 = ptr.copy()
var ar1 = Array(ptr)
var ar2 = Array(ptr)

func sumO(_ n:Int, _ p1:UnsafeMutablePointer<E>)->E {
  var r = E(0.0)
  for i in 0..<n { r += p1[i] }
  return r
}

var a1:E=ptr.sum()
var a2:E=0
var a3:E=0
var a4:E=0
benchmark(title:"ipp sum") {a1 = ptr.sum()}
benchmark(title:"reduce sum") {a2 = ar1.reduce(0.0, +)}
benchmark(title:"swift loop sum") {a3 = sumO(ptr.count, ptr.p)}
benchmark(title:"C sum") {a4 = smSum_float(ptr.p, numericCast(ptr.count))}
print([a1,a2,a3,a4])

benchmark(title:"swift sin") { E.sinO(ptr.count, ptr.p, ptr2.p) }
print(ptr2.min())
benchmark(title:"vec swift sin") {ptr.sinO(ptr2)}
print(ptr2.min())
benchmark(title:"vec sin") {ptr.sin(ptr2)}
print(ptr2.min())

benchmark(title:"swift divCRev") { E.divCRev(ptr.count, ptr.p, 2.0, ptr2.p) }
print(ptr2.min())

benchmark(title:"vec divCRev arr") { ar1.divCRev(2.0, ar2) }
print(ar2.min())
benchmark(title:"vec divCRev") {ptr.divCRev(2.0, ptr2)}
print(ptr2.min())

