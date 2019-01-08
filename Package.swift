// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftyMKL",
    products: [
      .library( name: "SwiftyMKL-Static", type: .static, targets: ["SwiftyMKL"]),
    ],
    dependencies: [
      .package(url:"https://github.com/jph00/BaseMath.git", from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(name: "CIPL"),
        .target( name: "SwiftyMKL", dependencies: ["CIPL", "BaseMath"]),
        .target( name: "mkl-tool", dependencies: ["SwiftyMKL"]),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL"]),
    ]
)

