import XCTest
@testable import SwiftyMKLTests


extension SwiftyMKLTestsFloat {
  static var allTests : [(String, (SwiftyMKLTestsFloat)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testASum", testASum),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
      ("testPowx", testPowx),
      ("testPow", testPow),
    ]
  }
}
extension SwiftyMKLTestsDouble {
  static var allTests : [(String, (SwiftyMKLTestsDouble)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testASum", testASum),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
      ("testPowx", testPowx),
      ("testPow", testPow),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

