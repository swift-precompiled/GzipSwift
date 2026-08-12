// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "GzipSwift",
    products: [
        .library(
            name: "Gzip",
            targets: ["Gzip_PrecompiledProduct"]
        )
    ],
    targets: [
        .target(
            name: "Gzip_Aggregation",
            dependencies: ["Gzip"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "Gzip",
            url: "https://github.com/swift-precompiled/GzipSwift/releases/download/6.0.1/Gzip-47b59e48a7e7f7c11ea9c1d782e99df296efa7deb497f2ff82546edf7a21690b.xcframework.zip",
            checksum: "47b59e48a7e7f7c11ea9c1d782e99df296efa7deb497f2ff82546edf7a21690b"
        ),
        .target(
            name: "system-zlib",
            path: "Sources/system-zlib",
            sources: ["anchor.c"],
            packageAccess: false
        ),
        .target(
            name: "Gzip_PrecompiledProduct",
            dependencies: ["Gzip_Aggregation", "system-zlib"]
        )
    ]
)