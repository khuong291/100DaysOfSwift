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
//import AlamofireImage
import SwiftyJSON

class Downloader {
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)
    }
}

class MovieViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movieTitleLabel.text = movie.title
        cell.movieRatingView.rating = Double(movie.rating / 20)
        cell.movieImageView.image = movie.image
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func fetchMovies() {
        let movieURLString = "https://coderschool-movies.herokuapp.com/movies?api_key=xja087zcvxljadsflh214"

        Alamofire.request(.GET, movieURLString).responseJSON { response in

            let json = JSON(response.result.value!)
            let movies = json["movies"].arrayValue
            let queue = NSOperationQueue()
            for movie in movies {
                let title = movie["title"].string
                let rating = movie["ratings"]["audience_score"].double
                let imageURLString = movie["posters"]["thumbnail"].string

                let movie = Movie()
                movie.title = title!
                movie.rating = rating!

                let operation = NSBlockOperation(block: {
                    movie.image = Downloader.downloadImageWithURL(imageURLString!)
                    NSOperationQueue.mainQueue().addOperationWithBlock() {
                        self.tableView.reloadData()
                    }
                })
                queue.addOperation(operation)

                self.movies.append(movie)
                self.tableView.reloadData()

            }
        }
    }
}
