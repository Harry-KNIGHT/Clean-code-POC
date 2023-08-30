// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Api",
	platforms: [.iOS(.v16)],
	products: [
		.library(
			name: "Api",
			targets: ["Api"])
	],

	dependencies: [],

	targets: [
		.target(
			name: "Api",
			dependencies: [],
			resources: [
				.process("Resources")
			]
		),
		.testTarget(
			name: "ApiTests",
			dependencies: ["Api"])
	]
)
