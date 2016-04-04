//: Playground - noun: a place where people can play

import UIKit

func doubler(input: Int) -> Int {
    return input * 2
}

func makeMultiplier(multiplier: Int) -> ((Int) -> Int) {
    let closure = { (input: Int) -> Int in
        return input * multiplier
    }
    return closure
}

let tripler = makeMultiplier(4)(3)

let incrementer = { (input: Int) -> Int in
    return input + 1
}

incrementer(5)

var someArithmethic: Int -> Int

someArithmethic = doubler
someArithmethic(10)
someArithmethic = makeMultiplier(3)
someArithmethic(10)
someArithmethic = incrementer
someArithmethic(10)

func repeater(times times: Int, value: Int, closure: Int -> Int) -> Int {
    var workingValue = value
    for _ in 1...times {
        workingValue = closure(workingValue)
    }
    return workingValue
}
repeater(times: 5, value: 10, closure: doubler) // double 10, 5 times – 320
repeater(times: 99, value: 1, closure: incrementer) // increment 1, 99 times – 100