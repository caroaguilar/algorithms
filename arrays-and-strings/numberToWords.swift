// Convert a non-negative integer num to its English words representation.

// Hint #1
// Did you see a pattern in dividing the number into chunk of words? For example, 123 and 123000.

// Hint #2
// Group the number by thousands (3 digits). You can write a helper function
// that takes a number less than 1000 and convert just that chunk to words.

// Hint #3
// There are many edge cases. What are some good test cases? Does your code work
// with input such as 0? Or 1000010? (middle chunk is zero and should not be printed out)

func convertChunk(_ num: Int) -> String {
    let units: [Int: String] = [
        1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"
    ]
    let teens: [Int: String] = [
        10: "ten", 11: "eleven", 12: "twelve", 3: "thirteen", 4: "fourteen", 5: "fifteen", 6: "sixteen", 7: "seventeen", 8: "eightteen", 9: "nineteen"
    ]
    let tens: [Int: String] = [
        20: "twenty", 30: "thirty", 40: "fourty", 50: "fifty", 60: "sixty", 70: "seventy", 80: "eighty", 90: "ninety"
    ]

    var word: String = ""

    // Tens
    let numTens = num % 100

    if numTens < 20 {
        // teens case
        word = "\(teens[numTens]!)"
    } else {
        // Units
        let numUnits = num % 10
        word = "\(tens[numTens - numUnits]!) \(units[numUnits]!)"
    }
    // Hundreds
    let numHundreds = num / 100

    if (numHundreds) > 0 {
        word = "\(units[numHundreds]!) hundred \(word)"
    }

    return word
}

print(convertChunk(123))

func numberToWords(_ num: Int) -> String {

    var chunk: Int = num % 1000
    var word: String = convertChunk(chunk)

    while chunk != num { //check this
        let chunkWord = convertChunk(chunk)
        word = "\(word) \(chunkWord))"
    }
    return ""
}

// Input: num = 123
// Output: "One Hundred Twenty Three"

// Input: num = 12345
// Output: "Twelve Thousand Three Hundred Forty Five"

// Input: num = 1234567
// Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

// Input: num = 1234567891
// Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"