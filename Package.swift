// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "swiftwebapp",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.8.1")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "9.1.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.5"),
    ],
    targets: [
      .target(name: "swiftwebapp", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger"]),
      .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","Health",

      ]),

      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ])
    ]
)
