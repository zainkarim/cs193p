import Cocoa

// Simple values
let explicitFloat: Float = 4
print(explicitFloat)

// Value conversion
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

// Including values in Strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let orangeSummary = "I have \(oranges) oranges."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let num1: Float = 2.3
let num2: Float = 4.1
let num3: Float = 3.9
let average: Float = (num1 + num2 + num3) / 3
let averageSummary = "The average is \(average)."
print(averageSummary)

/*
let name = "Zain"
let greeting = "Hello, \(name)!"
print(greeting)
*/

// Arrays and Dictionaries
/* Array and dictionary types must be explicitly declared unless Swift already knows the type
 */
var fruits: [String] = []
fruits = []

// Control Flow
let individualScores = [12, 32, 14, 25, 18, 15, 21]
var teamScore = 0

for score in individualScores{
    if score > 10 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print("Score: \(teamScore) 🎉") // 21

// You can use if and let together to work with values that might be missing
var optionalString: String? = "Hello"
print(optionalString == nil) // false

var optionalName: String? = nil
var greeting = "Hello!"

/* Unwrapping an optional:
 `name` is a new variable -- if `optionalName` is NOT nil, then its value will be unwrapped (assigned) to `name`
 However, if `optionalName` IS nill, then the part after the brackets will be skipped if there's no `else` clause. */

if let name = optionalName {
    greeting = "Hello, \(name)."
} else {
    greeting = "Hello, stranger."
}

print(greeting)
