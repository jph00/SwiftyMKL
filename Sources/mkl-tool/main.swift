import Foundation
import CoreFoundation
import SwiftyMKL

let a:VectorFloat = [1.0, 2, 3]
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

typealias T = VectorFloat
//typealias T = VectorDouble
let size = 1000000
var ptr = T(size)
ptr.data[3] = -1.2
ptr.data[5] =  0.2
let array = Array(ptr.data)

var t = array.reduce(0.0, +)
t = ptr.nrm2()
benchmark(title:"ipp") {print(ptr.nrm2())}
benchmark(title:"reduce") {print(array.reduce(0.0, {$0 + $1*$1}).squareRoot())}

