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
    targets: [
        .target(
            name: "SteppableSlider", 
            path: "Sources"
            sources: ["SteppableSlider"]
        ),
        .target(
            name: "RxSteppableSlider",
            dependencies: ["SteppableSlider"],
            path: "Sources",
            sources: ["RxSteppableSlider"]
        )
    ]
)
