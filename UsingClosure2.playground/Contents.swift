//: Playground - noun: a place where people can play

import UIKit

var hello: () -> String = {
    return "Hello"
}
hello()

var double: Int -> Int = { number in
    return number * 2
}

double(2)

var alsoDouble = double
