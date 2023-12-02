import Foundation

let day: (Algorithm, Algorithm) = (part1, part2)

private let part1: Algorithm = { input in
	return input
		.split(separator: "\n")
		.compactMap { line in
			let game = line
				.split(separator: ":")
			
			let gameIsPossible = game[1]
				.split(separator: ";")
				.allSatisfy { cubeSet in
					cubeSet
						.split(separator: ",")
						.allSatisfy { countedCubes in
							let countedCubesSplit = countedCubes.split(separator: " ")
							let amount = Int(countedCubesSplit[0])!
							switch countedCubesSplit[1] {
							case "blue":
								return amount <= 14
							case "green":
								return amount <= 13
							case "red":
								return amount <= 12
							default: fatalError()
							}
						}
				}
		
			if gameIsPossible {
				return Int(game[0].split(separator: " ")[1])!
			} else {
				return nil
			}
		}
		.reduce(0, +)
}

private let part2: Algorithm = { input in
	return input
		.split(separator: "\n")
		.map { line in
			var maxRedCubesAmount = 0
			var maxGreenCubesAmount = 0
			var maxBlueCubesAmount = 0
			
			for cubeSet in (
				line
					.split(separator: ":")[1]
					.split(separator: ";")
			) {
				for countedCubes in (
					cubeSet
						.split(separator: ",")
				) {
					let countedCubesSplit = countedCubes.split(separator: " ")
					let amount = Int(countedCubesSplit[0])!
					switch countedCubesSplit[1] {
					case "red":
						if amount > maxRedCubesAmount {
							maxRedCubesAmount = amount
						}
					case "green":
						if amount > maxGreenCubesAmount {
							maxGreenCubesAmount = amount
						}
					case "blue":
						if amount > maxBlueCubesAmount {
							maxBlueCubesAmount = amount
						}
					default: fatalError()
					}
				}
			}
			return maxRedCubesAmount * maxGreenCubesAmount * maxBlueCubesAmount
		}
		.reduce(0, +)
}
