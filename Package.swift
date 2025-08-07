// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let frameworkURL = "https://github.com/darjeelingsteve/spm-framework-two/releases/download/1.1.13/FrameworkTwo.xcframework.zip"
let frameworkChecksum = "0654edb19701fb91d10fe0c0441178c9d11ff374cd4ea80701bcd13363aa77e2"

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
            name: "FrameworkOne",
            url: "https://github.com/darjeelingsteve/spm-framework-one/releases/download/1.0.4/FrameworkOne.xcframework.zip",
            checksum: "ef0b321bda483f3dfed359e5a812e1f61686765b2ed380e45637389125151d4f"),
        .target(
            name: "FrameworkTwoTargets",
            dependencies: [
                .target(name: "FrameworkOne"),
                .target(name: "FrameworkTwo")
            ],
            path: "FrameworkTwoTargets")
    ]
)
