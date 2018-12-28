import XCTest
@testable import SwiftyMKLTests


extension SwiftyMKLTestsFloat {
  static var allTests : [(String, (SwiftyMKLTestsFloat)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
      ("testPowx", testPowx),
      ("testPow", testPow),
      ("testNormDiff_Inf", testNormDiff_Inf),
      ("testPackIncrement", testPackIncrement),
      ("testZero", testZero),
      ("testSet", testSet),
      ("testMove", testMove),
    ]
  }
}
extension SwiftyMKLTestsDouble {
  static var allTests : [(String, (SwiftyMKLTestsDouble)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
      ("testPowx", testPowx),
      ("testPow", testPow),
      ("testNormDiff_Inf", testNormDiff_Inf),
      ("testPackIncrement", testPackIncrement),
      ("testZero", testZero),
      ("testSet", testSet),
      ("testMove", testMove),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

