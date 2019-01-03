import Foundation
import CoreFoundation
import SwiftyMKL

let a:VectorP<Float> = [1.0, 2, 3]
print(a.count)
print(a)
print(a.asum())

IPP.setup()

func benchmarkTime(f: ()->()) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    f()
    return CFAbsoluteTimeGetCurrent() - start
}

func benchmark(title:String, f:()->()) {
    let time = benchmarkTime(f:f)
    print("Time for \(title): \(time) s.")
}

typealias E=Float
//typealias E=Double
typealias T = VectorP<E>
let size = 1000000
var ptr = T(size)
ptr[3] = -1.2
ptr[5] =  0.2
var array = Array(ptr)

var t = array.reduce(0.0, +)
var a1:E=0
var a2:E=0
t = ptr.nrm2()
benchmark(title:"ipp") {a1 = ptr.nrm2()}
benchmark(title:"reduce") {a2 = array.reduce(0.0, {$0 + $1*$1}).squareRoot()}
print(a1)
print(a2)

benchmark(title:"ipp/") {ptr.divCRev(2.0, ptr)}
benchmark(title:"reduce/") {
  for i in 0..<array.count { array[i] = 2.0/array[i] }
}
print(ptr.min())
print(array.min())

