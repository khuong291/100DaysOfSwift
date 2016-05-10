import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

DataManager.getTopAppsDataFromItunesWithSuccess { (data) -> Void in
    var json: [String: AnyObject]!

    do {
        json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
    } catch {
        print(error)
        XCPlaygroundPage.currentPage.finishExecution()
    }
    guard let topApps = TopApps(json: json) else {
        print("Error initializing object")
        XCPlaygroundPage.currentPage.finishExecution()
    }
    guard let firstItem = topApps.feed?.entries?.first else {
        print("No such item")
        XCPlaygroundPage.currentPage.finishExecution()
    }
    print(firstItem)

    XCPlaygroundPage.currentPage.finishExecution()
    
}
