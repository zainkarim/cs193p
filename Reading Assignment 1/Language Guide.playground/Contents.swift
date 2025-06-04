import Cocoa

/* The Basics */

// Tuples
let http404error = (404, "Not Found")
let (statusCode, statusMessage) = http404error
print("The status code is \(statusCode).")
print("The status message is \(statusMessage).")

let(justTheStatusCode, _) = http404error
print("The status code is \(justTheStatusCode).")

print("The status code is \(http404error.0).")
print("The status message is \(statusMessage).")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode).")
print("The status message is \(http200Status.description).")

/* Basic Operators */

// Unary Minus Operator
let three = 3
let minusThree = -three         // minusThree equals -3
let plusThree = -minusThree     // plusThree equals 3, or "minus minus 3"

// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix

// Ternary Conditional Operator
// question ? answer1 : answer2
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// Range Operators
/// Closed Range Operators
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/// Half-Open Range Operator
/// Runs from a to b, but doesn't include b
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

/// One-Sided Ranges
/// Goes as far as possible in one direction
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

/* Strings and Characters */

// Concatenating Strings and Characters
let exclamationMark: Character = "!"
var welcome = "Hello"
welcome.append(exclamationMark) // Hello!

// String Interpolation
print("6 times 7 is \(6 * 7).")

// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters.")

// Accessing and Modifying a String
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"
