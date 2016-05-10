//
//  ViewController.swift
//  UsingAlamofireAndSwiftyJSON
//
//  Created by Khuong Pham on 3/26/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblJSON.dataSource = self

//        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").response { (request, response, data, error) -> Void in
//            print(response)
//            let outputString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(outputString)
//        }

        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .Success(let value):
//                let swiftyJsonVar = JSON(responseData.result.value!)
                let swiftyJsonVar = JSON(value)

                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            case .Failure(let error):
                print(error.description)
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tblJSON.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        return cell
    }

}

