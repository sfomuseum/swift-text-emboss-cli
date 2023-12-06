// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "text-emboss",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/sfomuseum/swift-text-emboss", from: "0.0.3"),
        // .package(name: "swift-text-emboss", path: "/usr/local/sfomuseum/swift-text-emboss")
    ],
    targets: [
        .executableTarget(
            name: "text-emboss",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "TextEmboss", package: "swift-text-emboss"),
            ]),
    ]
)
