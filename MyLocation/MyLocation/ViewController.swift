//
//  ViewController.swift
//  MyLocation
//
//  Created by Khuong Pham on 3/22/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var coreLocationManager = CLLocationManager()

    @IBOutlet var locationInfoLabel: UILabel!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        coreLocationManager.delegate = self

        let authorizationCode = CLLocationManager.authorizationStatus()
    }


    @IBAction func updateLocationButtonTapped(sender: AnyObject) {
    }
}

