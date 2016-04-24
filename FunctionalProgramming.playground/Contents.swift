//: Playground - noun: a place where people can play

import UIKit

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
println(evens)
