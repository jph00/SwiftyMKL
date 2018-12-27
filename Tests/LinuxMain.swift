import XCTest
@testable import SwiftyMKLTests


extension SwiftyMKLTestsFloat {
  static var allTests : [(String, (SwiftyMKLTestsFloat)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testASum", testASum),
      ("testAbs", testAbs),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
    ]
  }
}
extension SwiftyMKLTestsDouble {
  static var allTests : [(String, (SwiftyMKLTestsDouble)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testASum", testASum),
      ("testAbs", testAbs),
      ("testAdd", testAdd),
      ("testDivC", testDivC),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

