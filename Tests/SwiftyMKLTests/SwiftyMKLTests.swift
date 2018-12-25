import XCTest
@testable import SwiftyMKL

protocol TestProtocol where T:Vector, T.Element:FloatingPoint {
  associatedtype T
  var a:T {get}
  var z:T.Element {get}
}

extension TestProtocol {
  func testASum() {
    let exp = a.reduce(z) {$0 + abs($1)}
    XCTAssertEqual(a.asum(), exp)
  }
}

class SwiftyMKLTestsFloat:  XCTestCase, TestProtocol {
  let a:VectorF = [1.0, 2, 3]
  let z:Float = 0.0
}

class SwiftyMKLTestsDouble: XCTestCase, TestProtocol {
  let a:VectorD = [1.0, 2, 3]
  let z:Double = 0.0
}


/*
class SwiftyMKLTests: XCTestCase {
}

class SwiftyMKLTestsFloat: SwiftyMKLTests {
  func testASum() {
    let a: VectorF = [1.0, 2, 3]
    XCTAssertEqual(a.asum(), 6.0)
  }
}

class SwiftyMKLTestsDouble: SwiftyMKLTests {
  func testASum() {
    let a: VectorD = [1.0, 2, 3]
    XCTAssertEqual(a.asum(), 6.0)
  }
}
*/

