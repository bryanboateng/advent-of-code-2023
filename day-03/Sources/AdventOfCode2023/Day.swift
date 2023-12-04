import RegexBuilder
import Foundation

let day: (Algorithm, Algorithm) = (part1, part2)
let numberPattern = #/(\d+)/#


func wefowo(
	line: some StringProtocol,
	numberMatch: Regex<Regex<(Substring, Substring)>.RegexOutput>.Match
) -> Bool {
	if (
		line[numberMatch.range]
			.contains { character in
				return !(character.isNumber || character == ".")
			}
	) {
		return true
	}
	if numberMatch.range.lowerBound != line.startIndex {
		let beforeIndex = line.index(before: numberMatch.range.lowerBound)
		if line[beforeIndex] != ".", !line[numberMatch.range.upperBound].isNumber {
			return true
		}
	}
	if numberMatch.range.upperBound != line.endIndex {
		if line[numberMatch.range.upperBound] != ".", !line[numberMatch.range.upperBound].isNumber {
			return true
		}
	}
	return false
}

private let part1: Algorithm = { input in
	let lines = input
		.split(separator: "\n")
		.map { substring in
			String(substring)
		}

	return zip(lines.indices, lines)
		.map { (lineIndex, line) in
			return line
				.matches(of: numberPattern)
				.filter { numberMatch in
					if numberMatch.range.lowerBound != line.startIndex {
						if line[line.index(before: numberMatch.range.lowerBound)] != "." {
							return true
						}
					}
					if numberMatch.range.upperBound != line.endIndex {
						if line[numberMatch.range.upperBound] != "." {
							return true
						}
					}
					if lineIndex != lines.startIndex {
						if wefowo(
							line: lines[lines.index(before: lineIndex)],
							numberMatch: numberMatch
						) {
							return true
						}
					}
					if lineIndex != lines.endIndex - 1{
						if wefowo(
							line: lines[lines.index(after: lineIndex)],
							numberMatch: numberMatch
						) {
							return true
						}
					}
					return false
				}
				.map { match in
					Int(match.output.1)!
				}
				.reduce(0, +)
		}
		.reduce(0, +)
}

private let part2: Algorithm = { input in
	let lines = input
		.split(separator: "\n")
		.map { substring in
			String(substring)
		}

	return zip(lines.indices, lines)
		.map { (index, line) in
			return line.matches(of: "*")
				.compactMap { match in
					let sameline = line
						.matches(of: numberPattern)
						.filter { weofbe in
							if weofbe.range.upperBound != line.endIndex {
								if match.range.contains(weofbe.range.upperBound) {
									return true
								}
							}
							if weofbe.range.lowerBound != line.startIndex {
								if match.range.contains(line.index(before: weofbe.range.lowerBound)) {
									return true
								}
							}
							return false
						}
						.map { gw in
							Int(gw.output.1)!
						}

					let nextLine = lines[lines.index(after: index)]
					let nextwe = nextLine
						.matches(of: numberPattern)
						.filter { weofbe in
							if weofbe.range.upperBound != nextLine.endIndex {
								if match.range.contains(weofbe.range.upperBound) {
									return true
								}
							}
							if weofbe.range.lowerBound != nextLine.startIndex {
								if match.range.contains(nextLine.index(before: weofbe.range.lowerBound)) {
									return true
								}
							}

							return match.range.overlaps(weofbe.range)
						}
						.map { gw in
							Int(gw.output.1)!
						}


					let beforeLine = lines[lines.index(before: index)]
					let beforewe = beforeLine
						.matches(of: numberPattern)
						.filter { weofbe in
							if weofbe.range.upperBound != beforeLine.endIndex {
								if match.range.contains(weofbe.range.upperBound) {
									return true
								}
							}
							if weofbe.range.lowerBound != beforeLine.startIndex {
								if match.range.contains(beforeLine.index(before: weofbe.range.lowerBound)) {
									return true
								}
							}

							return match.range.overlaps(weofbe.range)
						}
						.map { gw in
							Int(gw.output.1)!
						}

					let wef = sameline + nextwe + beforewe
					if wef.count == 2 {
						return wef
							.reduce(1, *)
					} else {
						return nil
					}
				}
				.reduce(0, +)
		}
		.reduce(0, +)
}
