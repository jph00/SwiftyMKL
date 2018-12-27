import XCTest
@testable import SwiftyMKL


protocol TestProtocol where T:Vector {
  associatedtype T
  var v1:T {get}
  var v2:T {get}
  var zero:T.Element {get}
  var two :T.Element {get}
}


class SwiftyMKLTestsFloat:  XCTestCase, TestProtocol {
  override class func setUp() {
    super.setUp()
    IPP.setup()
  }

  let zero:Float = 0.0
  let two :Float = 2.0
  let v1:VectorFloat = [1.0, -2,  3]
  let v2:VectorFloat = [0.5, 12, -2]
}
class SwiftyMKLTestsDouble:  XCTestCase, TestProtocol {
  override class func setUp() {
    super.setUp()
    IPP.setup()
  }

  let zero:Double = 0.0
  let two :Double = 2.0
  let v1:VectorDouble = [1.0, -2,  3]
  let v2:VectorDouble = [0.5, 12, -2]
}

extension TestProtocol where T.Element:SupportsMKL {
  func testVersion() {
    XCTAssertNotNil(MKL.get_version_string().range(of:"Intel"))
    XCTAssertGreaterThan(IPP.getLibVersion().major, 2012, "IPP Version too old or missing")
  }

  func testASum() {
    let exp = v1.reduce(zero) {$0 + abs($1)}
    XCTAssertEqual(v1.asum(), exp)
  }

  func testSum() {
    let exp = v1.reduce(zero, +)
    XCTAssertEqual(v1.sum(), exp)
  }

  func testDot() {
    let exp = zip(v1,v2).map(*).reduce(zero, +)
    let r1 = v1.dot(v2)
    XCTAssertEqual(r1, exp)
  }

  func testAbs() {
    let exp = T(v1.map {abs($0)})
    let r1 = v1.abs()
    XCTAssertEqual(r1, exp)
    let r2 = v1.copy()
    v1.abs(r2)
    XCTAssertEqual(r2, exp)
    v1.abs_()
    XCTAssertEqual(v1, exp)
  }

  func testAdd() {
    let exp = T(zip(v1,v2).map(+))
    let r1 = v1.add(v2)
    XCTAssertEqual(r1, exp)
    let r2 = v1.copy()
    v1.add(v2, r2)
    XCTAssertEqual(r2, exp)
    let r3 = v1 + v2
    XCTAssertEqual(r3, exp)
    let r4 = v1.copy()
    r4.add_(v2)
    XCTAssertEqual(r4, exp)
    let r5 = v1.copy()
    r5 += v2
    XCTAssertEqual(r5, exp)
  }

  func testDivC() {
    let exp = T(v1.map {$0/two})
    let r1 = v1.div(two)
    XCTAssertEqual(r1, exp)
    let r2 = v1.copy()
    v1.div(two, r2)
    XCTAssertEqual(r2, exp)
    let r3 = v1 / two
    XCTAssertEqual(r3, exp)
    let r4 = v1.copy()
    r4.div_(two)
    XCTAssertEqual(r4, exp)
    let r5 = v1.copy()
    r5 /= two
    XCTAssertEqual(r5, exp)
  }


  func testPowx() {
    let exp = T(v1.map {$0 ^^ two})
    let r1 = v1.powx(two)
    XCTAssertEqual(r1, exp)
    let r2 = v1.copy()
    v1.powx(two, r2)
    XCTAssertEqual(r2, exp)
    v1.powx_(two)
    XCTAssertEqual(v1, exp)
  }

  func testPow() {
    let exp = T(zip(v1,v2).map(^^))
    let r1 = v1.pow(v2)
    XCTAssertEqual(r1, exp)
    let r2 = v1.copy()
    v1.pow(v2, r2)
    XCTAssertEqual(r2, exp)
    v1.pow_(v2)
    XCTAssertEqual(v1, exp)
  }

}

