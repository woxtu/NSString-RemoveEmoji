// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "NSString_RemoveEmoji",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2),
    ],
    products: [
        .library(name: "NSString_RemoveEmoji", targets: ["NSString_RemoveEmoji"]),
    ],
    targets: [
        .target(name: "NSString_RemoveEmoji"),
        .testTarget(name: "NSString_RemoveEmojiTests", dependencies: ["NSString_RemoveEmoji"]),
    ]
)
