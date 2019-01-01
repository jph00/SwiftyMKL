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

typealias T = VectorP<Float>
//typealias T = VectorP<Double>
let size = 1000000
var ptr = T(size)
ptr[3] = -1.2
ptr[5] =  0.2
let array = Array(ptr)

var t = array.reduce(0.0, +)
t = ptr.nrm2()
benchmark(title:"ipp") {print(ptr.nrm2())}
benchmark(title:"reduce") {print(array.reduce(0.0, {$0 + $1*$1}).squareRoot())}

