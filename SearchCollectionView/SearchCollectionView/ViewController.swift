//
//  ViewController.swift
//  SearchCollectionView
//
//  Created by Khuong Pham on 3/31/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UISearchResultsUpdating {

    @IBOutlet var collectionView: UICollectionView!

    var heroes: [Hero]!
    var heoresFiltered: [Hero]?

    var searchBarActive = false
    var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()

        heroes = [Hero]()
        heoresFiltered = [Hero]()
        let headerView = HeaderView()

        self.collectionView.registerClass(headerView, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")

        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()



            return controller
        })()
//        let abaddon = Hero(name: "abaddon")
//        let ember = Hero(name: "ember")
//        let gondar = Hero(name: "gondar")
//        let kael = Hero(name: "kael")
//        let kunkka = Hero(name: "kunkka")
//        let layana = Hero(name: "layana")
//        let lucifer = Hero(name: "lucifer")
//        let omni = Hero(name: "omni")
//        let soul = Hero(name: "soul")
//        let wind = Hero(name: "wind")
//        heroes = [abaddon, ember]
        heroes = ["abaddon","ember","gondar", "kael", "kunkka", "layana", "lucifer", "omni", "soul", "wind"].map { Hero(name: $0) }
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchBarActive ? (heoresFiltered?.count)! : heroes.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell

        let hero = heroes[indexPath.row]
        cell.nameLabel.text = hero.name
        cell.imageView.image = hero.image

        return cell
    }
}

