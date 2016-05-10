//: Playground - noun: a place where people can play

import UIKit

// Declaring a closure
var hello: () -> String = {
    return "Hello"
}
hello()

var double: Int -> Int = { number in
    return number * 2
}
double(2)

var alsoDouble = double
alsoDouble(3)

var numbers = [1, 4, 2, 5, 8, 3]

numbers.sortInPlace({ x, y in
    return x < y
})
print(numbers)

var multipleParametersAndReturnValue: (String, String) -> (String) = {
    return $0 + " " + $1
}
multipleParametersAndReturnValue("Khuong", "Pham")

// Capturing Values
var number = 0
var addOne = {
    number += 1
}

var printNumber = {
    print(number)
}
addOne
printNumber

func makeIterator(start: Int, step: Int) -> () -> Int {
    var i = start
    return {
        let currentValue = i
        i += step
        return currentValue
    }
}

var iterator = makeIterator(1, step: 1)

iterator()
iterator()
iterator()

var anotherIterator = makeIterator(1, step: 3)

anotherIterator()
anotherIterator()
anotherIterator()
anotherIterator()

func sum(from from: Int, to: Int, f: (Int) -> (Int)) -> Int {
    var sum = 0
    for i in from...to {
        sum += f(i)
    }
    return sum
}
sum(from: 1, to: 5) { (number) -> (Int) in
    return number
}
sum(from: 1, to: 5) {
    $0
}

sum(from: 1, to: 3) {
    $0 * $0
}

// Homeworks
func applyKTimes(times: Int, _ closure: () -> ()) {
    for _ in 0..<times {
        closure()
    }
}
applyKTimes(3) {
    print("Khuong")
}

let numberArray = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
let numberMutipleOfThree = numberArray.filter{$0 % 3 == 0}
print(numberMutipleOfThree)

let randomNumbers = [4, 7, 1, 9, 6, 5, 6, 9]
let maxNumber = randomNumbers.reduce(randomNumbers[0]) {
    $0 > $1 ? $0 : $1
}

class User {
    var age: Int
    init(_ age: Int) {
        self.age = age
    }
}

let users = [User(1), User(8), User(5)]
let largestAge = users.map{$0.age}.reduce(0) { $0 > $1 ? $0 : $1 }

let myNumbers = [1, 2, 3, 4, 5, 6]
let myResult = myNumbers.filter{$0 % 2 == 1}.map{$0 * $0}.reduce(0, combine: +)

var array = [1, 2, 3, 4]
array.forEach {
    print("array[\($0-1)] is: \($0)")
}





