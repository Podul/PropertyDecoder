// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PropertyDecoder",
    products: [
        .library(name: "PropertyDecoder", targets: ["PropertyDecoder"])
    ],
    targets: [
        .target(name: "PropertyDecoder"),
        .testTarget(name: "PropertyDecoderTests", dependencies: ["PropertyDecoder"])
    ],
    swiftLanguageVersions: [.v5]
)
