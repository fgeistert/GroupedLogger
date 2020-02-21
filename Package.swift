// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "GroupedLogger",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "GroupedLogger", targets: ["GroupedLogger"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "GroupedLogger", dependencies: [], path: "GroupedLogger/")
    ]
)
