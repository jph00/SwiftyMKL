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
      ("testPackIndices", testPackIndices),
      ("testPackMasked", testPackMasked),
      ("testZero", testZero),
      ("testSet", testSet),
      ("testMove", testMove),
      ("testGaussian", testGaussian),
      ("testGaussianMulti1", testGaussianMulti1),
      ("testGaussianMulti2", testGaussianMulti2),
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
      ("testPackIndices", testPackIndices),
      ("testPackMasked", testPackMasked),
      ("testZero", testZero),
      ("testSet", testSet),
      ("testMove", testMove),
      ("testGaussian", testGaussian),
      ("testGaussianMulti1", testGaussianMulti1),
      ("testGaussianMulti2", testGaussianMulti2),
    ]
  }
}

XCTMain([
    testCase(SwiftyMKLTestsFloat.allTests),
    testCase(SwiftyMKLTestsDouble.allTests),
])

