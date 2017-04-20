//: Playground - noun: a place where people can play

import UIKit

// swift's String type is bridged with Foundation's NSString class. if you import Foundation,
// you can access NSString methods on Strings without casting anything

// empty strings can be initialized like C# or with String()
// the below two strings are equal to each other
let emptyString = ""
let anotherEmptyString = String()

// String has an isEmpty property
if emptyString.isEmpty {
    print("Nothing to see here")
}

// swift strings are value types, so the value of the string is copied when passed to a function
// they're not pass-by-reference, so you can change them without repercussions

// can access Character values for a String by iterating over the characters property with a for-in loop
for character in "Here are some characters".characters {
    print(character)
}

// create stand-alone characters with the explicit Character type
let exclamationMark: Character = "!"
//let failedAttempt: Character = "!!" // does not compile
let questionMark = "?" // assumed to be a string by default

// strings can be initialized by passing an array of Character values 
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// string concats work with the + operator
// string concats also work with the += operator

// can append a character to a string with the .append method
var welcome = "welcome"
print(welcome.append(exclamationMark))

// can't append a string or a char to a character
// string interpoloation works with the \(varName) syntax

// special characters that can be included in string literals
// \0 (null)
// \\ (backslash)
// \t (horizontal tab)
// \n (line feed)
// \r (carriage return)
// \" (double quote)
// \' (single quote)
// any arbitrary unicode scalar written as \u{n} where n is a 1-8 digit hex number in valid Unicode

// to get the count of characters in a string, use the .count property of the .characters property
print("\(welcome) has \(welcome.characters.count) characters")

// cannot index a string with an integer value because of some funky unicode
// extended grapheme cluster character combination business.
//print("\(welcome[4])") // does not compile

// use the startIndex property to get the index of the first character in the string
// use the endIndex property to get the index after the last character in the string. note that it's not 
// a valid index number
// if a string is empty, startIndex and endIndex are equal

// can access the indices before and after a given index using the index(before:) and index(after:) methods
// to access an index farther away, use the index(_:offsetBy:J) method
// can use the subscript syntax to access the Character at a particular String index
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(index) // not an integer. instead, it's an index class of some sort
greeting[index]


// attempting to access an index outside of a string's range or access a character
// at an index outside of a string's range will trigger a runtime error
//greeting[greeting.endIndex] // does not compile
//greeting.index(after:greeting.endIndex) // does not compile















































