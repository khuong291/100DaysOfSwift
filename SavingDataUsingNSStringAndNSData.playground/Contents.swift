//: Playground - noun: a place where people can play

import UIKit

let fileManager = NSFileManager.defaultManager()

do {
    var documents = try fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
    print(documents)
    var url = NSURL(string: "quote.txt", relativeToURL: documents)
    let quote = "Four score and seven years ago."
    if let url = url {
        try quote.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding)
        var text = try String(contentsOfURL: url)
    }
} catch {
    print("error: \(error)")
}

if let trollFace = UIImage(named: "troll2.png") {
    let imageData = UIImagePNGRepresentation(trollFace)
    do {
        var documents = try fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
        var url = NSURL(string: "troll2.bin", relativeToURL: documents)
        imageData?.writeToURL(url!, atomically: true)
        if let trollData = NSData(contentsOfURL: url!) {
            let trollImage = UIImage(data: trollData)!
        }
    } catch {
        print(error)
    }
}
