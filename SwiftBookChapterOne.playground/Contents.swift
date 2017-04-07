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

// FUNCTIONS
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

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name:String) {
        self.radius = radius
        //self.name = name // nope, that's done by the super
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.141592654*radius*radius
    }
    
    override func simpleDescription() -> String {
        // turns out you can call methods in the \() syntax.
        return "This is a circle with \(area()) units of area."
    }
}

var circle = Circle(radius: 5, name:"someCircle")
circle.area()
circle.simpleDescription()


// properties may have a getter and a setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3 // this is unclear, but it's a property of the superclass
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "equilateral triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// initializers for subclasses have 3 steps:
// 1. set the value of properties that only belong to the subclass
// 2. call the superclass initializer
// 3. change the value of any properties defined by the superclass
// 4. any additional setup work can come after.

// use willSet and didSet to provide code that is run before and after setting a property, respectively.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            // newValue is the keyword used to access the incoming value
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
            willSet {
                triangle.sideLength = newValue.sideLength // make sure the triangle and square always have the same sideLength
        }
    }
    
    // initializers must be explicitly specified.
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// ? means optional similar to C#. 
// in item?.someProperty, if item is nil, then the whole expression is nil.

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
// let nextSideLength: Double = optionalSquare?.sideLength // does not compile
let nextSideLength: Double? = optionalSquare?.sideLength // need to specify which values are optional always
let thirdSideLength: Double = (optionalSquare?.sideLength)! // this compiles but i have no idea what it means

// just like C#, use the keyword enum to create an enum
enum Rank: Int {
    case ace = 1 // specified because the default is 0
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    // this doesn't change anything. not sure why jack, queen, and king are separated into a different case.
    //case two, three, four, five, six, seven, eight, nine, ten, jack, queen, king

    
    // enums can have included functions
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
    
    func compareRanks(rank: Rank) -> Rank {
        // using the conditional operator to keep it to one line.
        return (self.rawValue > rank.rawValue) ? self : rank
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

let jack = Rank.jack
let jackRawValue = jack.rawValue

var biggerRank = ace.compareRanks(rank: jack)
print(biggerRank.simpleDescription())


// by default swift's enumeration starts at 0 and increases by 1.
// can also use floats or strings as the raw type of an enum

// use init?(rawValue:) syntax to instantiate an enum from a raw value
// returns nil if no matching value.
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs // if no meaningful raw value, use the default
    func simpleDescription() -> String {
        switch self {
        case .spades: // it's weird there's no indent here for the switch cases.
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
        case .diamonds, .hearts:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// can add enum values when you instantiate
enum ServerResponse {
    case result(String, String) // note that these aren't named
    case failure(String)
    case promise(String)
}

let success = ServerResponse.result("6:00 AM", "8:09 PM")
let failure = ServerResponse.failure("Something went wrong. Have you tried turning it on/off again?")
let promise = ServerResponse.promise("Request received. We'll get back to you later.")

switch /*success failure*/ promise {
case let .result(sunrise, sunset): // sunrise and sunset so we can reference the variables later
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...\(message)")
case let .promise(message):
    print("Promise...\(message)")
}

// structures are created using the struct keyword
// structs can have inits and their own methods
// structs are copied when they are passed around! classes are passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// use the protocol keyword to declare a protocol.
// classes, enums, and structs can adopt protocols.
// what is a protocol?

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust() // first use of the mutating keyword we've seen. no explanation of it in the book
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "\n Now 100% adjusted."
    }
}

var simpleClass = SimpleClass()
simpleClass.adjust()
let simpleClassDescription = simpleClass.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    mutating func adjust() { // struct methods implementing protocols must be marked as mutating
        simpleDescription += " (adjusted)"
    }
}

var simpleStructure = SimpleStructure()
simpleStructure.adjust()
let simpleStructureDescription = simpleStructure.simpleDescription

enum SimpleEnum: ExampleProtocol {
    case simple, complicated
    //var simpleDescription: String = "A simple enum." // enum may not contain stored properties
    var simpleDescription: String
    {
        switch self {
        case .simple:
            return "Simple enum."
        case .complicated:
            return "Complicated enum."
        }
    }
    
    mutating func adjust() {
         print("enum has simply been adjusted.")
    }
}

var c = SimpleEnum.simple
print(c.simpleDescription)
c = SimpleEnum.complicated
c.adjust()
print(c.simpleDescription)

// the extension keyword can be used to add functionality to an existing type.
// this can be done on types you create, import from a library, or system types.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)."
    }
    mutating func adjust() {
        self += 42
    }
}

print (7.simpleDescription) // don't even have to declare it. that's cool
//7.adjust() // can't use any mutating member on an immutable value. literals are not mutable.
var myFavoriteNumber = 8
myFavoriteNumber.adjust()

protocol DoubleAbsoluteValue {
    var absoluteValue: Double { get }
}

extension Double: DoubleAbsoluteValue {
    var absoluteValue: Double {
        return self
    }
}
print(8.0.absoluteValue)

// when typing objects as a protocol type, methods and members outside the protocol definition are not available.
let protocolValue: ExampleProtocol = simpleClass
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty) // value of type ExampleProtocol has no member anotherProperty


// Error Handling

// can represent errors using any type (probably class, enum, struct) that adopts the Error protocol.
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 'throw' throws an error (whaaat) and 'throws' marks a function that can throw an error.
// if an error is thrown in a function, the function returns immediately 
// and the code that called the function handles the error.

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    if printerName == "On Fire!" {
        throw PrinterError.onFire
    }
    if printerName == "Never Has Paper" {
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}

// instead of try/catch, you use do/catch with 'try' in front of code that can throw an error
do {
    //let printerResponse = try send(job: 1040, toPrinter: "Jake's printer")
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner") // string comparisons are done with ==
    print(printerResponse)
}
catch {
    print(error)
}

// can provide multiple catch blocks that handle specific errors.
do {
    //let printerResponse = try send(job: 1440, toPrinter: "Gutenberg") // no error thrown
    //let printerResponse = try send(job: 1440, toPrinter: "Never Has Paper") // hits second catch block
    let printerResponse = try send(job: 1440, toPrinter: "On Fire!") // hits first catch block
    // i can't figure out how to trigger the last catch block
    print(printerResponse)
}
catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
}
catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
}
// if this last block is excluded, there's no compiler error.
catch {
    print(error) // 'error' must be the default for an error message.
}

// optional --> C# nullable
// can use try? to convert the result to an optional.
// if the function throws an error, the error is discarded and the result is nil
// otherwise the result is an optional containing the function result

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner") // nil

// use 'defer' inside a function to execute code that is always executed befoer the function returns
// regardless of whether the function throws an error.
// use to write setup and cleanup code next to each other even though they're executed differently.


var fridgeIsOpen = true
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana") // who puts bananas in the fridge?
fridgeContains("milk")
print(fridgeIsOpen)


// GENERICS
// write a name inside angle brackets to make a generic function or type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// use 'where' right before the body of the function/class/enum/struct/etc.
// to specify a list of requirements (to require the type to implement a protocol,
// to require two types to be the same, or to require the class to have a specific superclass
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
    }

anyCommonElements([1, 2, 3], [3])

func returnCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var itemsInCommon = [T.Iterator.Element]()
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    itemsInCommon.append(lhsItem)
                }
            }
        }
        return itemsInCommon
    }

returnCommonElements([1, 2, 3, 4], [2,3])


// writing <T: Equatable> is the same as writing <T> ... where T: Equatable
// looks like to specify two constraints (T: Sequence and T: Equatable)
// you need the where clause though
/*func commonElements<T: Sequence Equatable>(_ items: T) -> Bool
{
    for item in items {
        print(item)
    }
    return true
}*/
















