import ArgumentParser
import Foundation

typealias Algorithm = (String) -> Any

@main
struct AdventOfCode2023 {
	static func main() {
		guard let inputFileURL = Bundle.module
			.url(
				forResource: "input",
				withExtension: "txt"
			)
		else {
			fatalError("No input file found.")
		}
		let input = try! String(contentsOf: inputFileURL)
		let algorithms = day
		let results =
		"""
		Part 1: \(algorithms.0(input))
		Part 2: \(algorithms.1(input))
		"""
		print(results)
	}
}
