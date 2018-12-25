// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MKL",
    products: [
      .library( name: "SwiftyMKL", type: .static, targets: ["SwiftyMKL"]),
    ],
    targets: [
        .target( name: "SwiftyMKL"),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL"]),
    ]
)

