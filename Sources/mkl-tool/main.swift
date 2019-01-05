import Foundation
import CoreFoundation
import CSwiftyMKL
import SwiftyMKL

/*
let a:VectorP<Float> = [1.0, 2, 3]
print(a.count)
print(a)
print(a.asum())
*/

IPP.setup()

func benchmarkTime(f: ()->()) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<100 {f()}
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
ptr[3] = -1.2
ptr[5] =  0.2
var ptr2 = ptr.copy()
var ar1 = Array(ptr)
var ar2 = Array(ptr)

extension SupportsMKL where Element==Float {
  public static func smDivCRev(_ pSrc:PtrT , _ val:Element , _ pDst:MutPtrT , _ len:Int) {
    smDivCRev_32f(pSrc,val,pDst,numericCast(len)) }
}
extension SupportsMKL where Element==Double {
  public static func smDivCRev(_ pSrc:PtrT , _ val:Element , _ pDst:MutPtrT , _ len:Int) {
    smDivCRev_64f(pSrc,val,pDst,numericCast(len)) }
}

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
benchmark(title:"C sum") {a4 = smSum_32f(ptr.p, numericCast(ptr.count))}
print([a1,a2,a3])

func divCRevO1(_ n:Int, _ pSrc:UnsafeMutablePointer<E>, _ val:E, _ pDst:UnsafeMutablePointer<E>) {
  for i in 0..<n {pDst[i] = val/pSrc[i]}
}

func divCRevO(_ pSrc:Array<E>, _ val:E, _ pDst: Array<E>) {
  let n=pSrc.count
  let p1 = pSrc.p
  let p2 = pDst.p
  for i in 0..<n {p2[i] = val/p1[i]}
}

benchmark(title:"sm divCRev") {ptr.divCRev(2.0, ptr2)}
print(ptr2.min())
benchmark(title:"swift divCRev") { divCRevO(ar1, 2.0, ar2) }
print(ar2.min())

benchmark(title:"ptr divCRev") { divCRev(ptr.count, ptr.p, 2.0, ptr2.p) }
benchmark(title:"ptr divCRev2") { divCRev(ptr, 2.0, ptr2) }
benchmark(title:"C divCRev") { E.smDivCRev(ptr.p, 2.0, ptr2.p, ptr.count) }
print(ptr2.min())

