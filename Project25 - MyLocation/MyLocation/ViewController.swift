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

    var locationManager: LocationManager!

    @IBOutlet var locationInfoLabel: UILabel!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        coreLocationManager.delegate = self

        locationManager = LocationManager.sharedInstance

        let authorizationCode = CLLocationManager.authorizationStatus()

        if authorizationCode == CLAuthorizationStatus.NotDetermined && coreLocationManager.respondsToSelector("requestAlwaysAuthorization") || coreLocationManager.respondsToSelector("requestWhenInUseAuthorization") {
            if NSBundle.mainBundle().objectForInfoDictionaryKey("NSLocationAlwaysUsageDescription") != nil {
                coreLocationManager.requestAlwaysAuthorization()
            } else {
                print("No description provided")
            }
        } else {
            getLocation()
        }
    }

    func getLocation() {
        locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in
            self.displayLocation(CLLocation(latitude: latitude, longitude: longitude))
        }
    }

    func displayLocation(location: CLLocation) {
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), span: MKCoordinateSpanMake(0.05, 0.05)), animated: true)

        let locationPinCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationPinCoord
        mapView.addAnnotation(annotation)
        mapView.showAnnotations([annotation], animated: true)

        locationManager.reverseGeocodeLocationWithCoordinates(location) { (reverseGecodeInfo, placemark, error) -> Void in
            let address = reverseGecodeInfo?.objectForKey("formattedAddress") as! String
            self.locationInfoLabel.text = address
        }
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.NotDetermined || status != CLAuthorizationStatus.Denied || status != CLAuthorizationStatus.Restricted {
            getLocation()
        }
    }

    @IBAction func updateLocationButtonTapped(sender: AnyObject) {
        getLocation()
    }
}

