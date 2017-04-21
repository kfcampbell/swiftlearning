//: Playground - noun: a place where people can play

import UIKit

// the three primary collection types are arrays, sets, and dictionaries
// arrays: ordered collections of values
// sets: unordered collections of unique values
// dictionaries: unordered collections of key-value associations
// all of these types are mutable when assigned with var and immutable when assigned with let
// all of these collections are strongly-typed

// ARRAYS
// can initialize with Array<Element> or [Element]
var someInts = Array<Int>()
var otherInts = [Int]()

someInts.append(3)
someInts = []

// can intialize arrays with a default repeating value
var threeDoubles = Array(repeating: 0.0, count: 3)

// can make a new array by adding two arrays together. new order is left concatenated with right
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// can initialize an array with an array literal
var shoppingList/* unnecessary: [String]*/ = ["Eggs", "Milk"]

// use the count property to get  get the number of items in an array
print("The shopping list contains \(shoppingList.count) items.")

// use isEmpty to check whether count is 0
if shoppingList.isEmpty {
    print("List is empty")
} else {
    print("List is not empty")
}

// add an item by using the append method
shoppingList.append("A1 Sauce")

// can also use the += operator to add both single items and new arrays
shoppingList += ["Chocolate sauce"]
shoppingList += ["Ice cream", "beer", "cheese"]

// use a bracketed int index to get a value from the array
var firstItem = shoppingList[0]

// can change a certain list item by using a bracketed int index
shoppingList[0] = "5 dozen eggs"

print(shoppingList.count)

// can replace items in the list even if the replacement items array has a different length than 
// the current items in the list.
shoppingList[4...6] = ["Bananas", "Pears", "Celery", "Carrots", "Ham"] // does not compile
shoppingList[3...5] = ["Pears"]

// to insert an item at an index, use the insert(_:at:) method
shoppingList.insert("Syrup", at: 0)

// use remove(at:) to remove an item in the list. remove(at:) returns the removed item
let syrup = shoppingList.remove(at: 0)

// use removeLast() to remove the final item from an array
// this avoids the overhead from using remove(at:) and a count property call
let lastItem = shoppingList.removeLast()

// iterate over the array using a for in loop
for item in shoppingList {
    print(item + " ", terminator: "")
}

// to get the index from each item when iterating, use the enumerated() method
// which returns a tuple (index, item) for each item
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// SETS
// like an array, but items can only appear once and they have no order
// types must be hashable in order to be stored in a set. all basic types are hashable
// can make custom types hashable by conforming to the Hashable protocol.
// types doing so must provide a gettable Int property called hashValue,
// as well as providing an implementation of the equals operator (==).
// the implementation of == must be reflexive (a == a), symmetrical (a == b <--> b == a)
// and transitive (a == b && b == c <--> a == c)

// sets are written as Set<Element>
// initialize an empty set using Set<Element>()
var letters = Set<Character>()

letters.insert("a")
letters = []

// can also initialize sets with literals
var favoriteGenres: Set/* unnecessary: Set<String>*/ = ["quiet, sensitive indie rock", "rap", "punk"]

// set has a count property just like arrays
print("I have \(favoriteGenres.count) favorite genres")

// use isEmpty to check if the set is empty
if favoriteGenres.isEmpty {
    print("I hate music")
} else {
    print("I'm picky about my music")
}

// use insert(_:) to add an item to the set
favoriteGenres.insert("Whatever Why? does. I like that.")

// use remove(_:) to remove an item from the set. 
// remove(_:) returns the item if it existed, and nil if it didn't
// all items can be removed with removeAll() (or you could use [] to initialize to a new Set again)
if let removedGenre = favoriteGenres.remove("Rock") {
    print("I'm so over \(removedGenre)")
} else {
    print("I never liked it.")
}

// use contains(_:) to check whether a set contains an item
if favoriteGenres.contains("punk") {
    print("No gods. No masters. Against all authority. --> Left Bank Books")
} else {
    print("These millenials are ruining society.")
}

// use a for in loop to iterate over values in a set
// seems to be ordered by hashValue?
for genre in favoriteGenres {
    print("\(genre)")
}

// use sorted() to iterate over items in a specific order.
// swift uses the < operator to determine order
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// Set Operations
// intersection(_:)
// symmetricDifference(_:) returns vales in either, but not both
// union(_:) creates a new set with all of the values in both sets
// subtracting(_:) creates a new set with values not in the specified set
// similarly, subtract subtracts a given set from the set its called upon in place.
var oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
oddDigits.subtract(singleDigitPrimeNumbers)
for digit in oddDigits {
    print(digit, terminator: ", ")
}

// use == to determine whether two sets contain all of the same values
// use the isSubset(of:) method to determine whether all the values of a set are contained in the specified set
// use isSuperset(of:) to determine whether a set contains all of the values in a specified set
// use isStrictSubset(of:) and isStrictSuperset(of:) methods to perform the specified operation
// but return false if the sets are equal
// use isDisjoint(with:) to determine whether two sets have no values in common
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "dog", "cat"]
let cityAnimals: Set = ["bird", "mouse"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

// DICTIONARIES
// a dictionary is basically a hashtable. it stores key-value pairs with no ordering
// keys must be unique. Key types must conform to the Hashable protocol like a set's value type

// initialize using Dictionary<Key, Value> or [Key: Value]
var namesOfIntegers = [Int: String]()
//var namesOfIntegers = Dictionary<Int, String>()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] // if it's been preinitialized, can make it empty again just like arrays/sets
                      // but with a colon in the middle of the brackets

// can initialize with a literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


















































