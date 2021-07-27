// swift-tools-version:5.0

import PackageDescription

let package = Package (
    name: "HJVisualComponents",
    platforms: [
        .iOS(.v14_5)
    ],
    products: [
        .library(
            name: "HJVisualComponents",
            targets: ["HJVisualComponents"]),
    ],
    targets: [
        .target( name: "HJVisualComponents")
    ]
)
