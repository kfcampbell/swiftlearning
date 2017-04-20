//: Playground - noun: a place where people can play

import UIKit

// it is possible to declare multiple constants or multiple variables on a single line
var x = 0.0, y = 5.4, z = 8.8

// swift is really big on using let wherever possible instead of var.

// being explicit about a var's type is known as a Type Annotation
var welcomeMessage: String = "Hi"

// can define multiple variables of the same type on a single line
var red, green, blue: Double // it's okay not to give it a value
//print(red) // however, the variable must be initialized before being used

// constants and variables can contain almost any character (including unicode characters)
let π = 3.14159
let 你好 = "你好世界"
//let 🐶🐮 = "dogcow” // this gives an unterminated string literal though.

// one cannot change a constant to a variable or a variable to a constant
// also cannot redeclare a variable with the same name or change it to a different type

// can use reserved keywords as variable with the backtick ` syntax
var `var` = 5
print(`var`)

// by default, print prints a newline after the content. can avoid this like so:
print("this is a value", terminator: "anything can go here")
// by default, the terminator is a new line

// string interpolation is done with \(varName)
print("the value of var is \(`var`)")

/* comments work the same as in C++, C#, etc.
 /* except that multiline comments can be nested! */
 that'll be useful for debugging */

// semicolons aren't required (boo) unless there is multiple statements on one line
let cat = "cat"; print(cat)

// there's int, but also UInt8, Int32, etc. just like C, C++, and C#

// min and max values of integer types are accessed with min and max properties
let minValue = UInt8.min
let maxValue = UInt8.max

// Int and UInt are the same size as the platform size
// Double represents a 64-bit floating-point number. precision is at least 15 decimal degits.
// Float represents a 32-bit floating-point number. precision can be as little as 6 decimal digits.
// Swift always chooses Double rather than Float for inferring the type of floating point numbers.
// I should too.

// integer literals can be written as
// decimal (default, no prefix)
// binary (0b prefix)
// octal (0o prefix)
// hexidecimal (0x prefix)

// the below all have decimal values of 17
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// floating point numbers can be decimal (no prefix) or hexadecimal (with 0x prefix)
// must also have a number (decimal or hex) on both sides of the decimal point
// decimal floats can have an optional exponent indicated by E or e
// hex floats must have an exponent indicated by P or p
// 1.25e2 means 1.25 * 10^2
// 1.25e-2 means 1.25 * 10^-2
// 0xFp2 means 15 * 2^2 (60)
// 0xFp-2 means 15 * 2^-2 (3.75)

// all of the below have a decimal value of 12.1875
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 // they did it.

// padding with integers and adding underscores for readability don't affect the actual value
// of numbers at all.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// generally it's a good idea to use the Int type instead of UInt or more specific types even if 
// you're staying within their parameters. that way you can plug and play with Int functions
// and stuff without funky conversions

//let cannotBeNegative: UInt8 = -1 // overflow error
//let tooBig: Int8 = Int8.max + 1 // overflow error

// to convert between number types, you must make a new variable and cast the different types
// must provide casts or else Swift gets angry.
// however, casts only apply to variables and not literals because Swift gives literals implicit types
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// floating point values are always truncated when used to initialize values in an Int array
let floatingPointValue = 2.718
let intArray: [Int] = [Int(floatingPointValue), 4, 5, 8] // must be casted though or else it throws an error

// type aliases define an alternative name for an existing type using the typealias keyword.
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min

// booleans are declared with the Bool keyword. values are true and false
let orangesAreOrange = true
let turnipsAreDelicious = false

// types in tuples don't all have to be the same
// tuples are defined in parentheses and values are separated by commas
let http404Error = (404, "Not Found") // type is (Int, String)

// decomposing tuples is done by putting variable names into tuple syntax
let (statusCode, statusMessage) = http404Error
print("the status code is \(statusCode)")
print("the status message is \(statusMessage)")

// can limit the values extracted from the tuple with an underscore if you don't need them.
let (justTheStatusCode, _) = http404Error
print("the statuscode is \(justTheStatusCode)")

// can also access tuple members with indices
print("the status message is \(http404Error.1)")

// can name individual elements in a tuple when the tuple is defined
let http200Status = (statusCode: 200, description: "OK")

// if you name it, then you can use the names (as well as indices) to access values
print("the status code is \(http200Status.statusCode)")

// swift wants you to use tuples as the return values of functions.

// optionals in swift let you indicate the absence of a value for any type, even custom classes and stuff
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let numberAttempt = "hello, world"
let convertedNumberAttempt = Int(numberAttempt) // this is nil because the Int conversion returns an optional

// optionals are described with a ?, such as Int?
// this means the value is either an Int or nil.
var serverResponseCode: Int? = 404
serverResponseCode = nil

// nil can't work with non-optional constants and variables
//let attemptedValue = nil // doesn't compile
var attemptedString = "this is a string"
//attemptedString = nil // doesn't compile

// if you define an optional variable without providing a default value the variable is automatically
// set to nil
var answer: String?

// use if statements to find out whether an optional contains a value by comparing against nil
if convertedNumber != nil {
    print("convertedNumber contains an integer value: \(convertedNumber)") // Optional123
}

// access the actual value by using an exclamation mark at the end of the variable's name.







































