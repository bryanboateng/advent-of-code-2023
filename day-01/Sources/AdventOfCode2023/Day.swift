import Foundation

let day: (Algorithm, Algorithm) = (part1, part2)

private let part1: Algorithm = { input in
	return input
		.split(separator: "\n")
		.map {
			calibrationValues(line: $0)
		}
		.reduce(0, +)
}

private let part2: Algorithm = { input in
	return input
		.split(separator: "\n")
		.map {
			calibrationValues(line: convertWordsToDigits(line: String($0)))
		}
		.reduce(0, +)
}

func calibrationValues(line: some StringProtocol) -> Int {
	let digitsCharacters = CharacterSet.decimalDigits
	let firstDigit = line.first { character in
		digitsCharacters.contains(character.unicodeScalars.first!)
	}!
	let lastDigit = line.reversed().first { character in
		digitsCharacters.contains(character.unicodeScalars.first!)
	}!
	return Int("\(firstDigit)\(lastDigit)")!
}

func convertWordsToDigits(line: String) -> String {
	var line = line
	var newLine = ""
	while !line.isEmpty {
		if line.starts(with: "one") {
			newLine.append("1")
		} else if line.starts(with: "two") {
			newLine.append("2")
		} else if line.starts(with: "three") {
			newLine.append("3")
		} else if line.starts(with: "four") {
			newLine.append("4")
		} else if line.starts(with: "five") {
			newLine.append("5")
		} else if line.starts(with: "six") {
			newLine.append("6")
		} else if line.starts(with: "seven") {
			newLine.append("7")
		} else if line.starts(with: "eight") {
			newLine.append("8")
		} else if line.starts(with: "nine") {
			newLine.append("9")
		} else {
			newLine.append(String(line.first!))
		}
		line.removeFirst()
	}
	return newLine
}
