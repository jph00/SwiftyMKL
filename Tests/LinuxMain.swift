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
      ("testNormDiff_Inf", testNormDiff_Inf),
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
      ("testNormDiff_Inf", testNormDiff_Inf),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

