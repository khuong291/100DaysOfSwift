//: Playground - noun: a place where people can play

import UIKit

protocol Door {
    var isLocked: Bool { get set }
    func open()
    func close()
}
struct SlidingDoor: Door, CustomStringConvertible {
    var isLocked: Bool = false

    var description: String {
        return "A smooth sliding door"
    }

    func open() {
        print("whoosh!")
    }

    func close() {
        print("whoosh!")
    }
}

class BankVault: Door, CustomStringConvertible {
    var isLocked: Bool = true

    var description: String {
        if isLocked {
            return "A bank vault that is locked"
        } else {
            return "An unlocked bank vault"
        }
    }

    func open() {
        if isLocked {
            print("Locked!")
        } else {
            print("clang!")
        }
    }

    func close() {
        print("slam!!")
        isLocked = true
    }

    func unlock(combination: String) {
        isLocked = false
    }
}

let door1 = SlidingDoor()
let door2 = BankVault()

door1.open()
door2.open()
door2.unlock("xyzzy")
door2.open()

let allDoors: [Door] = [door1, door2]

for door in allDoors {
    print("Got door: \(door)")
}

