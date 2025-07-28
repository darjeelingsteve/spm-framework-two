// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameworkTwo",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FrameworkTwo",
            targets: ["FrameworkTwo"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "FrameworkTwo",
            url: "https://github.com/darjeelingsteve/spm-framework-two/releases/download/1.0.0/FrameworkTwo.xcframework.zip",
            checksum: "1a72db756f2b3b64fd79eec2089e5838c983d8500ee1aec839224d0b0cf1fb96"),
    ]
)
