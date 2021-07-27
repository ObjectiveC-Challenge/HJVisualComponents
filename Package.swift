// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "HJVisualComponents",
    platforms: [
        .iOS(.v14) 
    ],
    products: [
        .library(
            name: "HJVisualComponents",
            targets: ["HJVisualComponents"]),
    ],
    targets: [
        .target(
            name: "HJVisualComponents",
            path: "HJVisualComponents"
    ]
)
