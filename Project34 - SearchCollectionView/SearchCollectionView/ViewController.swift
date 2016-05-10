//
//  ViewController.swift
//  SearchCollectionView
//
//  Created by Khuong Pham on 3/31/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet var collectionView: UICollectionView!

    var heroes: [Hero]!
    var heroesFiltered: [Hero]?

    var searchBarActive: Bool = false
    var searchBarBoundsY: CGFloat?
    var searchBar: UISearchBar?

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar?.backgroundColor = UIColor.blueColor()
        addSearchBar()

        heroes = [Hero]()
        heroesFiltered = [Hero]()

        heroes = ["abaddon","ember","gondar", "kael", "kunkka", "layana", "lucifer", "omni", "soul", "wind"].map { Hero(name: $0) }
    }

    // MARK: CollectionView DataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchBarActive ? (heroesFiltered?.count)! : heroes.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell

        if searchBarActive {

            let hero = heroesFiltered![indexPath.row]
            cell.nameLabel.text = hero.name
            cell.imageView.image = hero.image

        } else {

            let hero = heroes[indexPath.row]
            cell.nameLabel.text = hero.name
            cell.imageView.image = hero.image

        }
        return cell
    }

    // MARK: SearchBar Delegate method

    func filterContentForSearchText(searchText:String) {
//        heroesFiltered = []
//        let heroNames = NSArray()
//
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", self.searchBar!.text!)
//        let array = (heroNames as NSArray).filteredArrayUsingPredicate(searchPredicate) as! [Hero]
//        heroesFiltered = array

        heroesFiltered = heroes.filter({ (hero) -> Bool in
            let countryText: NSString = hero.name
            return (countryText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count > 0 {
            searchBarActive = true
            filterContentForSearchText(searchText)
            collectionView.reloadData()
        } else {
            searchBarActive = false
            collectionView.reloadData()
        }

    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBarActive = false
        searchBar.resignFirstResponder()
        searchBar.text = ""
        collectionView.reloadData()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBarActive = true
        view.endEditing(true)
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar!.setShowsCancelButton(true, animated: true)
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBarActive = false
        self.searchBar!.setShowsCancelButton(false, animated: false)
    }

    // MARK: Add Search Bar

    func addSearchBar(){
        if self.searchBar == nil {
            self.searchBarBoundsY = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.size.height

            self.searchBar = UISearchBar(frame: CGRectMake(0,self.searchBarBoundsY!, UIScreen.mainScreen().bounds.size.width, 44))
            self.searchBar!.searchBarStyle = UISearchBarStyle.Default
            self.searchBar!.tintColor = UIColor.whiteColor()
            self.searchBar!.barTintColor = UIColor.whiteColor()
            self.searchBar!.delegate = self
            self.searchBar!.placeholder = "Search here"

            self.addObservers()
        }

        if !self.searchBar!.isDescendantOfView(self.view){
            self.view.addSubview(self.searchBar!)
        }
    }

    func addObservers(){
        let context = UnsafeMutablePointer<UInt8>(bitPattern: 1)
        self.collectionView?.addObserver(self, forKeyPath: "contentOffset", options: [.New,.Old], context: context)
    }

    func removeObservers(){
        self.collectionView?.removeObserver(self, forKeyPath: "contentOffset")
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
            if keyPath! == "contentOffset" {
                if let collectionV:UICollectionView = object as? UICollectionView {
                    self.searchBar?.frame = CGRectMake(
                        self.searchBar!.frame.origin.x,
                        self.searchBarBoundsY! + ( (-1 * collectionV.contentOffset.y) - self.searchBarBoundsY!),
                        self.searchBar!.frame.size.width,
                        self.searchBar!.frame.size.height
                    )
                }
            }
    }
}

