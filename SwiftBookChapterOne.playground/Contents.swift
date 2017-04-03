//: Playground - noun: a place where people can play

import UIKit

// CHAPTER ONE
var str = "Hello, playground"
print(str)
print("Hello World!")

// var ==> variables. let ==> constants.
var myVariable = 42
myVariable = 50
let myConstant = 42

// variable types are inferred. to be specific, use a colon after the variable name.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let otherDouble : Double = 45
print(otherDouble)
//let otherString : String = 7 // does not compile.
//let explicitInteger : Int = 4.5 // does not compile
let explicitFloat : Float = 4

// Swift doesn't automatically convert variable types.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//let widthLabel = label + width // does not compile

// use a \(variable) to include values in strings.
let apples = 3
let oranges = 7
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let floater : Float = 42.2384892
let floatString = "Hello Robot \(floater)"

// create dictionaries and arrays using brackets.
// Access their elements using the key/index in brackets.
var shoppingList = ["codfish", "hooks", "tights", "pixie dust"]
print(shoppingList[1])

var jerbs = [
    "Farmer John": "Wrestler",
    "Farmer Jim": "Announcer",
    "Farmer Joe": "Other Wrestler",
    "Farmer Juan": "Bystander",
]

// Xcode doesn't like just print(jerbs["Farmer John"]) because it's not type-safe or something.
print(jerbs["Farmer Jim"]) // Optional("Announcer")
print(jerbs["Farmer John"] ?? <#default value#>)
print(jerbs["Farmer Joe"]!) // force unwrap the conversion
print(jerbs["Farmer Juan"] as Any) // silences warning but still says Optional("Bystander")
print(jerbs["Not a Farmer"]) // nil

// add to array
jerbs["Farmer Junior"] = "Juan's kid"
print(jerbs["Farmer Junior"]!) // Juan's Kid


// create an empty array
var emptyArray = [String]()

// create empty dictionary
var emptyDictionary = [String: Float]()

// if type information can be inferred (e.g. you're not assigning float variables the value of 7),
// the following syntax can be used to initialize empty arrays and dictionary
emptyArray = []
emptyDictionary = [:]

// but this only works if the variable already exists
//let otherEmptyArray = [] // doesn't compile
//let otherEmptyDictionary = [:] // doesn't compile

// CONTROL FLOW
// there isn't any break required in switch statements in Swift.

//let vegetable = "red pepper"
let vegetable = "this doesn't with pepper..."
switch vegetable {
    case "celery":
    print("Why don't you eat it with ranch or peanut butter?")
    case "cucumber", "watercress":
        print("Who likes these vegetables anyway?")
    case let x where x.hasSuffix("pepper"): // this kinda reminds me of LINQ
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}
// if the default case is removed, the error is "switch must be exhaustive, consider adding a default clause

// iterating over dictionaries
let someNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var kindOfNumber = ""
for (kind, numbers) in someNumbers { // assign in-place variables to track the keys/values in the dictionary
    for number in numbers { // iterate through the values corresponding to a particular key
        if number > largest {
            largest = number
            kindOfNumber = kind
        }
    }
}

print(largest)
print(kindOfNumber)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

// do..while loops in swift become repeat..while
var m = 128
repeat {
    m *= 2
} while m < 100

print(m)

var total = 0
for i in 0..<4 { // this is the traditional way. it omits the last value. in this case, i is 0, 1, 2, 3.
    total += i
}
print(total)

total = 0
for i in 0...4 { // this includes the end value. i is 0, 1, 2, 3, 4
    total += i
}
print(total)

// declare a function using func.
// parameters are declared in a (varName: varType) syntax
// declare the return type using ->
func greet(person:String, day:String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person:"Bob", day:"Tuesday")
//greet("Bob", "Tuesday") // whoa! this doesn't compile! swift forces you to use the argument variable name when using the function. i kinda like that.
//greet(day:"Tuesday", person:"Bob") // this doesn't compile either. the arguments must even be in order.

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person); today is \(day)"
}
greet("John", on: "Wednesday")
greet(person:"John", day:"Wednesday") // this still compiles.
greet("John", on:"Wednesday") // this still compiles
//greet("John", day:"Wednesday") // does not compile
//greet("John", on day:"Wednesday") // does not compile

func otherGreeter(_ person: String, other day: String) -> String {
    return "Hello \(person); today is \(day)"
}
otherGreeter("Keegan", other:"Friday") // compiles
//otherGreeter("Keegan", day:"Friday") // doesn't compile
//otherGreeter(person:"Keegan", day:"Friday") // doesn't compile
// so "on" above isn't a protected keyword or anything. 
// still not sure of the purpose of including both "other" and "day"

// note that there must be a space in between the underscore and the name
// otherwise swift thinks that's just the argument name.
func thirdGreeter(_ person: String, _ day: String) -> String {
    return "Hello \(person); today is \(day)"
}

thirdGreeter("Keegan", "Saturday")
//thirdGreeter(person:"Keegan", day:"Saturday") // doesn't compile

// you can name various labels of tuples. that's pretty cool.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int)
{
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if(score > max) { // parentheses are allowed. can also remove the space in comparisons. that's probably not swifty though.
            max = score
        }
        else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum) // tuples are defined with parentheses
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.1) // max. tuple indices are zero-based.
print(statistics.max)

// to take an array of a variable number of arguments, use {Type}... in the function declaration
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

func calculateAverage(numbers: Float...) -> Float {
    let size : Float = Float(numbers.count)
    var average : Float = 0
    
    for number in numbers {
        average += number
    }
    
    return (average/size)
}

calculateAverage(numbers: 42, 597, 12)
calculateAverage(numbers: 5, 6, 7)
//calculateAverage(numbers: "4", "5", "6") // doesn't compile

// nested functions
func returnFifteen() -> Int {
    var y = 10

    func add() {
        // inner functions have access to the outer function's variables
        y += 5
    }
    add()
    return y
}

returnFifteen()

// functions can return other functions. whaaat.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

// a function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

// still works without explicit list argument.
func hasAnyMatches(numbers: Int..., condition: (Int) -> Bool) -> Bool {
    for number in numbers {
        if condition(number) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 17, 12, 22]
hasAnyMatches(list: numbers, condition: lessThanTen)
hasAnyMatches(numbers: 5, 2, 3, 10, 5, condition: lessThanTen)

// functions are a type of closures. closures are blocks of code that can be called later.
// I DON'T UNDERSTAND CLOSURES AT ALL. COME BACK AND REVIEW LATER.
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// i have no idea how to call the above thing.
//Numbers.map(5) // doesn't do it.

// i think this is supposed to rely on the numbers variable above?
let mappedNumbers = numbers.map({ number in 3 * number})
print(mappedNumbers)

// closures can refer to parameters by number instead of name
// sort numbers in descending order.
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

// use the class keyword to create a class.
class Shape {
    var numberOfSides = 0
    let helloWorld = "Hello, I'm a shape!"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    // i think you return void but just omitting the arrow and the function outputw.
    func setNumberOfSides(number: Int) {
        numberOfSides = number
    }
}

// instantiate just like C# but without the new keyword.
var shape = Shape()
var shapeDescription = shape.simpleDescription()
shape.setNumberOfSides(number: 5)
shapeDescription = shape.simpleDescription()

// use the . syntax to access the properties and methods of class instances.
shape.numberOfSides

// still need to know how to make things private.

// constructors are done with an init(parameters) function

class NamedShape {
    // default values can be assigned in the declaration of properties
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        // use the self keyword to distinguish between the class's property and the argument
        self.name = name
    }
    
    deinit
    {
        // do cleanup here before object is garbage collected.
        // no parameters are allowed on the deinitializer
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides)."
    }
}

// to subclass, use a colon and the superclass name after the subclass.
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name:String){
        self.sideLength = sideLength
        
        // call the constructor of the superclass
        super.init(name: name)
        //self.name = name // doesn't compile.
        //must call the superclass's intializer at some point otherwise the compiler throws an error.

        
        // can access properties of superclass the same as if they were properties of the subclass
        numberOfSides = 4
    }
    
    // functions marked as override but who aren't will throw a compiler error
    /*override*/ func area() -> Double {
        return sideLength * sideLength
    }
    
    // functions that aren't marked as override but who are will throw a compiler error
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let testSquare = Square(sideLength: 5.2, name: "I'm a square")
testSquare.area()
testSquare.simpleDescription()






















