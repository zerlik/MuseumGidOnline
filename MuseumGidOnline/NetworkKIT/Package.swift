// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "NetworkKIT",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NetworkKIT",
            targets: ["NetworkKIT"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "NetworkKIT",
            dependencies: [ ],
            path: "sources"
        ),
        .testTarget(
            name: "NetworkKITTests",
            dependencies: ["NetworkKIT"]
        ),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
