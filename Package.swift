// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftyMKL",
    products: [
      .library( name: "SwiftyMKL-Static", type: .static, targets: ["SwiftyMKL"]),
    ],
    targets: [
        .target( name: "CBaseMath"),
        .target( name: "BaseMath", dependencies: ["CBaseMath"]),
        .systemLibrary(name: "CIPL"),
        .target( name: "SwiftyMKL", dependencies: ["CIPL", "BaseMath"]),
        .target( name: "mkl-tool", dependencies: ["SwiftyMKL"]),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL"]),
    ]
)

