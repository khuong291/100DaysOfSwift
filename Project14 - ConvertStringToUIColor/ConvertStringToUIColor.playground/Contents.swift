//: Playground - noun: a place where people can play

import UIKit

let string1 = "rgb(25.00,100.0,100)"

let indexToRemoveTheLast = string1.endIndex.advancedBy(-1)
let substring1 = string1.substringToIndex(indexToRemoveTheLast)
let indexToRemoveTheFirst = string1.startIndex.advancedBy(4)
let substring2 = substring1.substringFromIndex(indexToRemoveTheFirst)

var colorsString = substring2.characters.split{$0 == ","}.map(String.init)
let red = (Float(colorsString[0])!) / 255
let green = (Float(colorsString[1])!) / 255
let blue = (Float(colorsString[2])!) / 255

let myColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)

