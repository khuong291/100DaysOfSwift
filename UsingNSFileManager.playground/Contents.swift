//: Playground - noun: a place where people can play

import UIKit

let fileManager = NSFileManager.defaultManager()
do {
    let document = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
    for index in 0...6 {
        let newString = String("I am a string #\(index)")
        let saveUrl = document.URLByAppendingPathComponent("string_\(index).txt")
        try newString.writeToURL(saveUrl, atomically: true, encoding: NSUTF8StringEncoding)
    }

    let directoryListing = try fileManager.contentsOfDirectoryAtURL(document, includingPropertiesForKeys: nil, options: .SkipsHiddenFiles)
    for url in directoryListing {
        print(url)
    }
} catch {
    print(error)
}
