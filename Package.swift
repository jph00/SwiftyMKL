// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftyMKL",
    products: [
      .library( name: "SwiftyMKL-Static", type: .static, targets: ["SwiftyMKL"]),
    ],
    targets: [
        .target( name: "CSwiftyMKL", dependencies: []),
        .target( name: "SwiftyMKL", dependencies: ["CSwiftyMKL"]),
        .target( name: "mkl-tool", dependencies: ["SwiftyMKL"]),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL"]),
    ]
)

