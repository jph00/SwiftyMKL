import XCTest
@testable import SwiftyMKLTests

extension SwiftyMKLTestsDouble {
  static var allTests : [(String, (SwiftyMKLTestsDouble)->()->())] {
    return [
      ("testASum", testASum),
    ]
  }
}

extension SwiftyMKLTestsFloat {
  static var allTests : [(String, (SwiftyMKLTestsFloat)->()->())] {
    return [
      ("testAdd", testASum),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

