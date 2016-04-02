//
//  ViewController.swift
//  UsingSQLite
//
//  Created by Khuong Pham on 4/2/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = NSFileManager.defaultManager()
        var sqliteDB: COpaquePointer = nil
        var dbUrl: NSURL? = nil


        do {
            let baseUrl = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            dbUrl = baseUrl.URLByAppendingPathComponent("swift.sqlite")
        } catch {
            print(error)
        }

        if let dbUrl = dbUrl {

            let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
            let status = sqlite3_open_v2(dbUrl.absoluteString.cStringUsingEncoding(NSUTF8StringEncoding)!, &sqliteDB, flags, nil)

            if status == SQLITE_OK {

                let errMsg: UnsafeMutablePointer<UnsafeMutablePointer<Int8>> = nil
                let sqlStatement = "create table if not exists Tutorials (ID Integer Primary key AutoIncrement, Title Text, Author Text, PublicationDate Date);";

                if sqlite3_exec(sqliteDB, sqlStatement, nil, nil, errMsg) == SQLITE_OK {
                    print("created table")
                } else {
                    print("failed to create table.")
                }

                var statement: COpaquePointer = nil
                let insertStatement = "insert into Tutorials (Title, Author, PublicationDate) values ('Intro to SQLite', 'Ray Wenderlich', '2014-08-10 11:00:00')"
                sqlite3_prepare_v2(sqliteDB, insertStatement, -1, &statement, nil)
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("inserted")
                } else {
                    print("not inserted")
                }
                sqlite3_finalize(statement)

                var selectStatement: COpaquePointer = nil
                let selectSql = "select * from tutorials"
                if sqlite3_prepare_v2(sqliteDB, selectSql, -1, &selectStatement, nil) == SQLITE_OK {
                    while sqlite3_step(selectStatement) == SQLITE_ROW {
                        let rowId = sqlite3_column_int(selectStatement, 0)
                        let title = UnsafePointer<CChar>(sqlite3_column_text(selectStatement, 1))
                        let author = UnsafePointer<CChar>(sqlite3_column_text(selectStatement, 2))
                        let date = UnsafePointer<CChar>(sqlite3_column_text(selectStatement, 3))

                        let titleString = String.fromCString(title)!
                        let authorString = String.fromCString(author)!
                        let dateString = String.fromCString(date)!
                        
                        print("\(rowId) \(titleString) \(authorString) \(dateString)")
                        
                    }
                }

            }
        }
    }
}

