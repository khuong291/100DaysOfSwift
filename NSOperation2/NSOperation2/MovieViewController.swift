//
//  MovieViewController.swift
//  NSOperation2
//
//  Created by Khuong Pham on 4/17/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import TTGEmojiRate
import Alamofire
import AlamofireImage
import SwiftyJSON

class MovieViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var movies: [NSDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
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
