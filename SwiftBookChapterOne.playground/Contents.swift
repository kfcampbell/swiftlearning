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




