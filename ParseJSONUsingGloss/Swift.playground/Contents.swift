//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
  // TODO: Process data
  XCPlaygroundPage.currentPage.finishExecution()
}
