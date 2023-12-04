import Foundation

let day: (Algorithm, Algorithm) = (part1, part2)
let numberPattern = #/(\d+)/#

private let part1: Algorithm = { input in
	return input
		.split(separator: "\n")
		.map { game in
			let matchingNumbersCount = matchingNumbersCount(game: game)
			if matchingNumbersCount > 0 {
				return pow(2, matchingNumbersCount - 1)
			} else {
				return 0
			}
		}
		.reduce(0, +)
}

private let part2: Algorithm = { input in
	var cardCount = 0
	var countByCard: [Int:Int] = [:]

	let games = input
		.split(separator: "\n")

	let gameCount = games.count
	for i in 1...gameCount {
		countByCard[i] = 1
	}

	for gameNumber in 1...gameCount {
		cardCount += countByCard[gameNumber]!
		let matchingNumbersCount = matchingNumbersCount(game: games[gameNumber - 1])
		for index in gameNumber..<gameNumber + matchingNumbersCount {
			countByCard[index+1]! += countByCard[gameNumber]!
		}
	}
	return cardCount
}

private func matchingNumbersCount(game: Substring) -> Int {
	let sides = game
		.split(separator: ":")[1]
		.split(separator: "|")
	return parseNumbers(sides[0]).intersection(parseNumbers(sides[1])).count
}

private func parseNumbers(_ substring: Substring) -> Set<Int> {
	Set(
		substring
			.matches(of: numberPattern)
			.map { match in
				Int(match.output.1)!
			}
	)
}
