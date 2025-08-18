// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let frameworkURL = "https://api.github.com/repos/darjeelingsteve/spm-framework-two/releases/assets/283694095.zip"
let frameworkChecksum = "10b44b1d2e8de68669d6f7143c2c4795a679ee5c9a9b3aa9af0144ade880f0be"

let package = Package(
    name: "FrameworkTwo",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FrameworkTwo",
            targets: ["FrameworkTwoTargets"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "FrameworkTwo",
            url: frameworkURL,
            checksum: frameworkChecksum),
        .binaryTarget(
            name: "FrameworkOneDependency",
            url: "https://github.com/darjeelingsteve/spm-framework-one/releases/download/1.0.4/FrameworkOne.xcframework.zip",
            checksum: "ef0b321bda483f3dfed359e5a812e1f61686765b2ed380e45637389125151d4f"),
        .target(
            name: "FrameworkTwoTargets",
            dependencies: [
                .target(name: "FrameworkOneDependency"),
                .target(name: "FrameworkTwo")
            ],
            path: "FrameworkTwoTargets")
    ]
)
