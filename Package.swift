// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SteppableSlider",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "SteppableSlider", 
            targets: ["SteppableSlider"]),
        .library(
            name: "RxSteppableSlider", 
            targets: ["RxSteppableSlider"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "SteppableSlider", 
            path: "Sources",
            sources: ["SteppableSlider"]
        ),
        .target(
            name: "RxSteppableSlider",
            dependencies: ["SteppableSlider", "RxSwift", "RxCocoa"],
            path: "Sources",
            sources: ["RxSteppableSlider"]
        )
    ]
)
