//: Playground - noun: a place where people can play

import UIKit

class BigEnderShield: NSObject, NSFileManagerDelegate {
    func fileManager(fileManager: NSFileManager, shouldRemoveItemAtURL URL: NSURL) -> Bool {
        var shouldDelete = true
        let urlString = URL.absoluteString
        if urlString.rangeOfString("bigender") != nil {
            shouldDelete = false
        }
        return shouldDelete
    }
}

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

    let bigEnderDirectory = document.URLByAppendingPathComponent("bigender")
    let littleEnders = document.URLByAppendingPathComponent("littleender")

    try? fileManager.createDirectoryAtURL(bigEnderDirectory, withIntermediateDirectories: false, attributes: nil)
    try? fileManager.createDirectoryAtURL(littleEnders, withIntermediateDirectories: false, attributes: nil)

    let bigEnderShield = BigEnderShield()
    fileManager.delegate = bigEnderShield

    for index in 0...6 {
        var destinationURL: NSURL
        let fileName = "string_\(index).txt"
        let targetItem = document.URLByAppendingPathComponent(fileName)

        if index % 2 == 0 {
            destinationURL = bigEnderDirectory
        } else {
            destinationURL = littleEnders
        }

        destinationURL = destinationURL.URLByAppendingPathComponent(fileName)

        try fileManager.removeItemAtURL(destinationURL)

    }

} catch {
    print(error)
}
