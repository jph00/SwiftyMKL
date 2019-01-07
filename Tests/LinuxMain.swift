import XCTest
@testable import SwiftyMKLTests


extension SwiftyMKLTestsVectorPFloat {
  static var allTests : [(String, (SwiftyMKLTestsVectorPFloat)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDiv", testDiv),
      ("testSubRev", testSubRev),
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
extension SwiftyMKLTestsArrayFloat {
  static var allTests : [(String, (SwiftyMKLTestsArrayFloat)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDiv", testDiv),
      ("testSubRev", testSubRev),
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
extension SwiftyMKLTestsVectorPDouble {
  static var allTests : [(String, (SwiftyMKLTestsVectorPDouble)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDiv", testDiv),
      ("testSubRev", testSubRev),
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
extension SwiftyMKLTestsArrayDouble {
  static var allTests : [(String, (SwiftyMKLTestsArrayDouble)->()->())] {
    return [
      ("testVersion", testVersion),
      ("testSum", testSum),
      ("testDot", testDot),
      ("testAbs", testAbs),
      ("testASum", testASum),
      ("testAdd", testAdd),
      ("testDiv", testDiv),
      ("testSubRev", testSubRev),
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
    testCase(SwiftyMKLTestsVectorPFloat.allTests),
    testCase(SwiftyMKLTestsArrayFloat.allTests),
    testCase(SwiftyMKLTestsVectorPDouble.allTests),
    testCase(SwiftyMKLTestsArrayDouble.allTests),
])

