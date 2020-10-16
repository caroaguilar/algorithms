// Implement atoi which converts a string to an integer.

// The function first discards as many whitespace characters as necessary until the first non-whitespace character is found.
// Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits
// as possible, and interprets them as a numerical value.
// The string can contain additional characters after those that form the integral number, which are
// ignored and have no effect on the behavior of this function.
// If the first sequence of non-whitespace characters in str is not a valid integral number, or if no
// such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
// If no valid conversion could be performed, a zero value is returned.

// Note:

// Only the space character ' ' is considered a whitespace character.
// Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1].
// If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.


// Example 1:
// Input: str = "42"
// Output: 42

// Example 2:
// Input: str = "   -42"
// Output: -42
// Explanation: The first non-whitespace character is '-', which is the minus sign. Then take as many numerical digits as possible, which gets 42.

// Example 3:
// Input: str = "4193 with words"
// Output: 4193
// Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.

// Example 4:
// Input: str = "words and 987"
// Output: 0
// Explanation: The first non-whitespace character is 'w', which is not a numerical digit or a +/- sign. Therefore no valid conversion could be performed.

// Example 5:
// Input: str = "-91283472332"
// Output: -2147483648
// Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer. Thefore INT_MIN (−231) is returned.


// Constraints:

// 0 <= s.length <= 200
// s consists of English letters (lower-case and upper-case), digits, ' ', '+', '-' and '.'.
func myAtoi(s: String) -> Int {

    var result: Int32 = 0
    var multiplier: Int32 = 1

    let charMap: [Character: Int] = ["0": 0, "1": 1, "2": 2 , "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9]
    let signMap: [Character: Int] = ["-": -1, "+": 1]
    var assignedDigit: Bool = false
    var assignedSign: Bool = false

    for c in s {

        if c == " " {
            if (assignedDigit || assignedSign) {
                break
            }
            continue
        }

        if let mult = signMap[c] {
            if (assignedDigit || assignedSign) {
                break
            }
            assignedSign = true
            multiplier = Int32(mult)
            continue
        }

        if let digit = charMap[c] {
            assignedDigit = true

            let newResult = (result &* 10) + Int32(digit)

            if newResult < result {
                return Int(multiplier == 1 ? Int32.max : Int32.min)
            }

            result = newResult

            continue
        }

        break
    }

    result = result * multiplier

    return Int(result)
}

print(myAtoi(s: "42"))
// Output: 42
print(myAtoi(s: "   -42"))
// Output: -42
print(myAtoi(s: "4193 with words"))
// Output: 4193
print(myAtoi(s: "words and 987"))
// Output: 0
print(myAtoi(s: "-91283472332"))
// Output: -2147483648
print(myAtoi(s: "+-12"))
// Output: 0
print(myAtoi(s: "01-02"))
// Output: 1
print(myAtoi(s: "------++++++---2232"))
// Output: 0
print(myAtoi(s: "   +0 123"))
// Output: 0