//: Playground - noun: a place where people can play

import UIKit

let maybeNumbers: [Int?] = [3, 7, nil, 12, 40]
for maybeValue in maybeNumbers {

    guard let value = maybeValue else {
        print("No Value")
        break
    }

    print(value)
}
//Output: 3, 7 and No Value

for maybeValue in maybeNumbers {

    guard let value = maybeValue else {
        print("No Value")
        continue
    }

    print(value)
}
//Output: 3, 7, No Value, 12 and 40

func getNumber() {
    do {
        //let test = try maybeNumbers[1] -> print 7
        if let test = try maybeNumbers[2] {
            print(test)
        }
    } catch {
        print("No Value")
    }
}

getNumber()

