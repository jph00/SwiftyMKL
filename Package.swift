// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftyMKL",
    products: [
      .library( name: "SwiftyMKL-Static", type: .static, targets: ["SwiftyMKL"]),
    ],
    targets: [
        .systemLibrary(name: "CIPL"),
        .target( name: "CSwiftyMKL", dependencies: ["CIPL"]),
        .target( name: "SwiftyMKL", dependencies: ["CIPL", "CSwiftyMKL"]),
        .target( name: "mkl-tool", dependencies: ["SwiftyMKL"]),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL"]),
    ]
)

