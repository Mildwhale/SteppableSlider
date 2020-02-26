import PackageDescription

let package = Package(name: "SteppableSlider",
                      platforms: [
                        .iOS(.v10)],
                      products: [
                        .library(
                            name: "StappableSlider",
                            targets: ["StappableSlider"])
                      ],
                      targets: [
                        .target(
                            name: "StappableSlider",
                            path: "StappableSlider/Sources"
                        )]
)
