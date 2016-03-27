//: Playground - noun: a place where people can play

import UIKit
import Darwin

struct numbers {

    var name: String = ""
    var number: Int = 0

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

var list = [numbers]()

for index in 0..<100 {
    let randomNumber = Int(arc4random_uniform(UInt32(100)))
    list.append(numbers(name: randomNumber.description, number: randomNumber))
}