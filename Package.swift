// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AmazonPublisherServicesVerveAdapter",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "AmazonPublisherServicesVerveAdapter", targets: ["APSVerveAdapterTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/amzn/swift-package-manager-amazon-aps.git", from: "5.6.6"),
        .package(url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git", from: "3.8.1")
    ],
    targets: [
        .target(
            name: "APSVerveAdapterTarget",
            dependencies: [
                "APSiOSVerveAdapter",
                .product(name: "AmazonPublisherServicesSDK", package: "swift-package-manager-amazon-aps"),
                .product(name: "HyBid", package: "hybid-ios-spm-sdk")
            ],
            path: "Sources/APSVerveAdapterTarget"
        ),
        .binaryTarget(
            name: "APSiOSVerveAdapter",
            url: "https://d14jk8f50gmy3e.cloudfront.net/iOS_APS_Verve_Adapter_SPM/APSVerveAdapter-1.0.0.zip",
            checksum: "675334c29535c64ff31e43a2e9268ad373c6d0502125688b158fc7b4a7ab8fdd"
        )
    ]
)
