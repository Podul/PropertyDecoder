// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PropertyDecoder",
    products: [
        .library(
            name: "PropertyDecoder",
            targets: ["PropertyDecoder"])
    ],
    targets: [
        .target(name: "PropertyDecoder")
    ],
    swiftLanguageVersions: [.v5]
)
