//
//  MovieViewController.swift
//  NSOperation2
//
//  Created by Khuong Pham on 4/17/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Cosmos
import Alamofire
import AlamofireImage
import SwiftyJSON

class MovieViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let test = ["a","b"]

    var movies: [NSDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MovieTableViewCell
        cell.movieTitleLabel.text = test[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }

    func fetchMovies() {
        let movieURLString = "https://coderschool-movies.herokuapp.com/movies?api_key=xja087zcvxljadsflh214"
        Alamofire.request(.GET, movieURLString).responseJSON { response in
            if let data = response.result.value as? NSDictionary {
                print(data)
            }
        }
    }
}
