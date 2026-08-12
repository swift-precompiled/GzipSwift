// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "GzipSwift",
    products: [
        .library(
            name: "Gzip",
            targets: ["Gzip", "Gzip_PrecompiledProduct"]
        )
    ],
    targets: [
        .target(
            name: "Gzip_Aggregation",
            dependencies: ["Gzip"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Gzip",
            url: "https://github.com/swift-precompiled/GzipSwift/releases/download/6.0.1/Gzip-b2ca1546fda8f6e4ec446dd9f83762f80b014ec4cf8f7ced7ec7669fd4cb3ce0.xcframework.zip",
            checksum: "b2ca1546fda8f6e4ec446dd9f83762f80b014ec4cf8f7ced7ec7669fd4cb3ce0"
        ),
        .target(
            name: "system-zlib",
            path: "Sources/system-zlib",
            sources: ["anchor.c"],
            packageAccess: false
        ),
        .target(
            name: "Gzip_PrecompiledProduct",
            dependencies: ["Gzip_Aggregation", "system-zlib"],
            packageAccess: false
        )
    ]
)