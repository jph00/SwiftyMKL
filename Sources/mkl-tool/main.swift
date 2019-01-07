import Foundation
import CoreFoundation
import CBaseMath
import BaseMath
import SwiftyMKL

IPP.setup()

func benchmarkTime(f: ()->()) -> Double {
  let start = CFAbsoluteTimeGetCurrent()
  for _ in 0..<10 {f()}
  return CFAbsoluteTimeGetCurrent() - start
}

func benchmark(title:String, f:()->()) {
  f()
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

let p = ptr.p
let p2 = ptr2.p
let c:Int32 = numericCast(ptr.c)

func sumO(_ n:Int, _ p1:UnsafeMutablePointer<E>)->E {
  var r = E(0.0)
  for i in 0..<n { r += p1[i] }
  return r
}

var a1:E=ptr.sum()
var a2:E=0
var a3:E=0
benchmark(title:"lib sum") {a1 = ptr.sum()}
benchmark(title:"reduce sum") {a2 = ar1.reduce(0.0, +)}
benchmark(title:"swift loop sum") {a3 = sumO(ptr.c, p)}
print([a1,a2,a3])

benchmark(title:"swift divRev") { E.divRev(ptr.count, p, 2.0, p2) }
print(ptr2.min())
benchmark(title:"vec divRev arr") { ar1.divRev(2.0, ar2) }
print(ar2.min())
benchmark(title:"vec divRev") {ptr.divRev(2.0, ptr2)}
print(ptr2.min())

benchmark(title:"vec sin") {ptr.sin(ptr2)}
print(ptr2.min())
benchmark(title:"sumsin") {a1 = ptr.sumsin()}
print(a1)

