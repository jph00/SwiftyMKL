import Foundation
import CoreFoundation
import SwiftyMKL

let a:VectorFloat = [1.0, 2, 3]
print(a.asum())


/*
IPP.setup()

func benchmarkTime(operation: ()->()) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    return CFAbsoluteTimeGetCurrent() - startTime
}

func benchmark(title:String, operation:()->()) {
    let timeElapsed = benchmarkTime(operation:operation)
    print("Time elapsed for \(title): \(timeElapsed) s.")
}

typealias T = Float
//typealias T = Double
let size = 1000000
var ptr = Vector<T>(size)
ptr.data[3] = -1.2
ptr.data[5] =  0.2
let array = Array(ptr.data)

var t = array.reduce(0.0, +)
t = ptr.nrm2()
benchmark(title:"ipp") {print(ptr.nrm2())}
benchmark(title:"reduce") {print(array.reduce(0.0, {$0 + $1*$1}).squareRoot())}

print(ptr.sum())
print(ptr.mean())
print(ptr.stdDev())
print(ptr.max())
print(ptr.min())
print(ptr.nrm2())
print("--")

var ptr2 = Vector<T>(size)
ptr.abs(ptr2)
print(ptr2.sum())
ptr2 = ptr.abs()
print(ptr.sum())
print(ptr2.sum())

var ptr3 = Vector<T>(size)
ptr.add(ptr2, ptr3)
print(ptr3.sum())

ptr.abs_()
print(ptr.sum())

let a:Vector = [1.0,2,3]
print(a)
*/

