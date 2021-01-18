
func numToInt(_ str: String) -> Int {
  let charMap: [Character: Int] = ["0": 0, "1": 1, "2": 2 , "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9]

  var multiplier: Int = 1
  var units: Int = 1
  var num: Int = 0

  for d in str.reversed() {
    if (d == "-") {
      multiplier = -1
      break
    }

    let digit = charMap[d]
    num += digit * units
    units = units * 10
  }

  return num * multiplier
}

