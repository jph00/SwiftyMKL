// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MKL",
    products: [
      .library( name: "SwiftyMKL", type: .static, targets: ["SwiftyMKL"]),
    ],
    targets: [
        .systemLibrary(name: "CMKL", pkgConfig: "mkl-static-lp64-seq"),
        .systemLibrary(name: "CIPP"),
        .target( name: "SwiftyMKL", dependencies: ["CMKL", "CIPP"]),
        //.target( name: "mkl-tool", dependencies: ["SwiftyMKL"]),
        .testTarget( name: "SwiftyMKLTests", dependencies: ["SwiftyMKL", "CMKL", "CIPP"]),
    ]
)

