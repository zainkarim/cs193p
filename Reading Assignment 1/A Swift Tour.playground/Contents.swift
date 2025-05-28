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

// providing a default value
let nickname: String? = "Johnny"
let fullName: String = "John Appleseed"
let informalGreeting: String = "Hi \(nickname ?? fullName)!"

if let nickname {
    print("Hey, \(nickname)!")
}

// for in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kindOfNumber = ""
for (numType, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfNumber = numType
        }
    }
}
print("The largest number is \(largest) which is a \(kindOfNumber) number.")

// Functions
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0


    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }


    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.1)
// Prints "100"

// functions can return other functions
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// functions can be passed as arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Closure
/* Closures are blocks of code that can be called later. You can execute a closure outside of the scope it was created in (e.g. nested functions)*/

// takes each element in [numbers], multiplies by 3, returns a new array
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// rewrite closure to return zero for all ODD numbers
numbers.map({ (number: Int) -> Int in
    if (number % 2 != 0){
        return 0
    } else {
        return number
    }
})

// consisely written closure
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers) // [60, 57, 21, 36]

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers) // [20, 19, 12, 7]

// Objects and Classes
class Shape {
    //property declaration
    var numSides = 0
    let angleSum = 360
    
    //func declaration
    func simpleDescription() -> String {
        return "A shape with \(numSides) sides."
    }
    func angleDescription() -> String {
        return "Each angle in this shape is \(angleSum / numSides) degrees."
    }
}

var shape = Shape()
shape.numSides = 7
var shapeDescription = shape.simpleDescription() + "\n" + shape.angleDescription()
print(shapeDescription)

// class with initializer
class Vehicle {
    let make: String
    let model: String
    let year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    func vehicleDescription() -> String {
        return "The vehicle is a \(year) \(make) \(model)."
    }
}

var car = Vehicle(make: "Honda", model: "Civic", year: 2012)
print(car.vehicleDescription())

// subclass
class Sedan: Vehicle {
    var numPassengers: Int
    init(make: String, model: String, year: Int, numPassengers: Int) {
        self.numPassengers = numPassengers
        super.init(make: make, model: model, year: year)
    }
    
    func fullDescription() -> String {
        return "\(vehicleDescription()) It can fit \(numPassengers) passengers."
    }
}

let mySedan = Sedan(make: "Honda", model: "Accord", year: 2016, numPassengers: 5)
print(mySedan.fullDescription())

// Enums and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue


enum Suit {
    case spades, hearts, diamonds, clubs


    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func createDeck() -> [Card] {
    var deck: [Card] = []
    
    for suit in [Suit.spades, .hearts, .clubs, .diamonds] {
        for rawValue in 1...13 {
            if let rank = Rank(rawValue: rawValue) {
                let card = Card(rank: rank, suit:suit)
                deck.append(card)
            }
        }
    }
    return deck
}

let deck = createDeck()
for card in deck.prefix(52) {
    print(card.simpleDescription())
}

