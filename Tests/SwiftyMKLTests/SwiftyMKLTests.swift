import XCTest
@testable import SwiftyMKL

protocol TestProtocol where T:Vector {
  associatedtype T
  var a:T {get}
  var z:T.Element {get}
}

extension TestProtocol where T.Element:FloatingPoint {
  func testASum() {
    let exp = a.reduce(z) {$0 + $1}
    XCTAssertEqual(a.asum(), exp)
  }
}

class SwiftyMKLTestsFloat:  XCTestCase, TestProtocol {
  let a:VectorFloat = [1.0, 2, 3]
  let z:Float = 0.0
}

class SwiftyMKLTestsDouble: XCTestCase, TestProtocol {
  let a:VectorDouble = [1.0, 2, 3]
  let z:Double = 0.0
}

