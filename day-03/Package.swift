// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "AdventOfCode2023",
	platforms: [
		.macOS(.v13)
	],
	products: [
		.executable(
			name: "AdventOfCode2023",
			targets: ["AdventOfCode2023"]),
	],
	dependencies: [
	],
	targets: [
		.executableTarget(
			name: "AdventOfCode2023",
			dependencies: [
			],
			resources: [
				.process("Resources/input.txt")
			]),
	]
)
