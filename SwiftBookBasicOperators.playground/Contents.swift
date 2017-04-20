//: Playground - noun: a place where people can play
import UIKit

// the swift assignment operator doesn't return a value so it can't be used accidentally instead of ==
// arithmetic operators (+, -, *, /, %, etc.) detect and disable overflow.
// swift has special operators that allow overflow
// a..<b --> from a through the value one less than b
// a...b --> from a through the value of b

// if the right side of an assignment is a tuple, its elements can be decomposed
// into multiple constants or variables at once
let (x, y) = (1, 2)

/*if x = y { // this is invalid to prevent accidental assignment errors
    
}*/

// the addition operator works for string concats
let helloWorld = "hello " + "world"

let someValue = 9 % 4 // 1
let anotherValue = -9 % 4 // -1 so remainder operator, not mod
let thirdValue = 9 % -4 // 1. the sign on the right operand is ignored

// swift provides compound assignment operators like +=
// swift supports all standard comparison operators (==, !=, >, <, >=, <=)
// swift also has identity operators === and !==.
// these are used to test whether object references refer to the same object instance 
// (not that values are the same)

// can compare tuples.
// tuples are compared from left to right, one value at a time
// all values in a tuple must be comparable (and thus not have boolean values)
(1, "zebra") < (2, "apple") // true because of the first case. the strings aren't compared
(3, "apple") < (3, "bird") // true because apple is less than bird
//(4, true) < (3, true) // errors out because of the booleans

// note that comparisons only work on tuples with 6 or less elements in them.

// the ternary conditional operator works the same as in C-like languages
// condition ? valueIfTrue : valueIfFalse

// the nil-coalescing operator works the same as in C-like languages
// useValueIfNotNil ?? useValueIfLeftSideIsNil

// can use nil-coalescing operator even when value is not nullable, but you get warned about it
let aName: String = "name"
let otherName: String = aName ?? "no name here"

// the closed range operator includes the end value
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// half-open range operator includes the opening value but not the closing one
let names = ["Moira", "Dinah", "Ivy", "Tekla"]
for i in 0..<names.count {
    print("Person \(i) is called \(names[i])")
}

// logical operators work the same as in other C-like languages
// !a, a && b, a || b are supported
// logical operators are left-associative, so compound expressions with ultiple logical operators
// evaluate the leftmost subexpression first
// but use parentheses to make it explicit because that's just good practice.g






















































