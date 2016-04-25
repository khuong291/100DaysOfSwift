//: Playground - noun: a place where people can play

import UIKit

var evens = [Int]()

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

evens = Array(1...10).filter{ $0 % 2 == 0 }
print(evens)

//func reduce<U>(initial: U, combine: (U, T) -> U) -> U
var evenSum = evens.reduce(0) { $0 + $1 }
print(evenSum)

let maxNumber = Array(1...10).reduce(0) { max($0, $1) }
print(maxNumber)

let numbers = Array(1...10).reduce("numbers: ") { $0 + "\($1)"}
print(numbers)

let digits = ["3", "1", "4", "1"]
//let myDigit = Int(digits.reduce("") { $0 + $1 })
let myDigit = digits.reduce(0) { 10 * $0 + Int($1, radix: 10)! }
print(myDigit)

let animals = ["Cat", "Chicken", "Fish", "Dog", "Mouse", "Pig", "Monkey"]
typealias Entry = (Character, [String])

func buildIndex(words: [String]) -> [Entry] {
    var result = [Entry]()
    var letters = [Character]()
    for word in words {
        let firstLetter = Character(word.substringToIndex(word.startIndex.advancedBy(1)).uppercaseString)
        if !letters.contains(firstLetter) {
            letters.append(firstLetter)
        }
    }
    for letter in letters {
        var wordsForLetter = [String]()
        for word in words {
            let firstLetter = Character(word.substringToIndex(word.startIndex.advancedBy(1)).uppercaseString)
            if firstLetter == letter {
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    return result
}
print(buildIndex(animals))

