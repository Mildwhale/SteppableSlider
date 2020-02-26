import PackageDescription

let package = Package(
    name: "SteppableSlider",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "SteppableSlider", targets: ["SteppableSlider"])
    ],
    targets: [
        .target(name: "SteppableSlider", path: "SteppableSlider/Sources"
        )]
)
