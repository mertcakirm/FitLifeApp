// swift-tools-version: 5.8

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "FitLife",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "FitLife",
            targets: ["App"],
            bundleIdentifier: "com.example.FitLife",
            teamIdentifier: "",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .heart),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "App",
            path: "Sources/App"
        )
    ]
)