// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let frameworkURL = "https://github.com/darjeelingsteve/spm-framework-two/releases/download/1.1.8/FrameworkTwo.xcframework.zip"
let frameworkChecksum = "85c97dca1f7e42a705d3de2f207c6d80c97408e77ab639f38a9581b2ee227b47"

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
            url: "https://github.com/darjeelingsteve/spm-framework-one/releases/download/1.0.1/FrameworkOne.xcframework.zip",
            checksum: "9722bdaa6f9dedb0a5243e4e48c5e9675c5baa37f97f03f24f796adc67cb9ba6"),
        .target(
            name: "FrameworkTwoTargets",
            dependencies: [
                .target(name: "FrameworkOne"),
                .target(name: "FrameworkTwo")
            ],
            path: "FrameworkTwoTargets")
    ]
)
