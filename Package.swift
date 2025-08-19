// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let frameworkURL = "https://api.github.com/repos/darjeelingsteve/spm-framework-two/releases/assets/284013415.zip"
let frameworkChecksum = "85c132b33cccda58039289725ffb8de3fcc9f6192f87ce9dc0524de5187cbc2d"

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
