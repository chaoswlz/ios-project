//
//  GameViewController.swift
//  ios-project
//
//  Created by Jason Cheung on 2016-11-04.
//  Copyright © 2016 Manjot. All rights reserved.
//

import UIKit
import MapKit

import Firebase

class GameViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    let notificationCentre = NotificationCenter.default
    let locationManager = CLLocationManager()
    var locationUpdatedObserver : AnyObject?
    var temppin : MKPointAnnotation = MKPointAnnotation()
    
    var db: FIRDatabaseReference!
    
    var locations: [FIRDataSnapshot]! = []
    
    let username = "hello"
    
    fileprivate var _refHandle: FIRDatabaseHandle!
    
    var map : Map = Map(topCorner: MKMapPoint(x: 49.247815, y: -123.004096), botCorner: MKMapPoint(x: 49.254675, y: -122.997617), tileSize: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Center map on Map coordinates
        MapView.setRegion(convertRectToRegion(rect: map.mapActual), animated: true)
        
        //Disable user interaction
        MapView.isZoomEnabled = false;
        MapView.isScrollEnabled = false;
        MapView.isUserInteractionEnabled = false;
        
        var tempLocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.2508484, longitude: -123.0040408)
        temppin = MKPointAnnotation()
        
        locationUpdatedObserver = notificationCentre.addObserver(forName: NSNotification.Name(rawValue: Notifications.LocationUpdated),
                                                                 object: nil,
                                                                 queue: nil)
        {
            (note) in
            let location = Notifications.getLocation(note)
            
            if let location = location
            {
                let lat = location.coordinate.latitude
                let long = location.coordinate.longitude
                self.MapView.removeAnnotation(self.temppin)
                
                // SETTING UP ARRAY OF VALUES TO BE POSTED TO DB
                let mdata : [String: Double] = [
                    "lat": lat, "long": long
                ]
                
                // POSTING TO DB
                self.db.child("locations").childByAutoId().setValue(mdata)
                
                // POSTING LAT LONG TO MAP
                tempLocation  = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                // DEBUG
                print(lat.description + " " + long.description)
                // END OF DEBUG
                
                self.temppin = MKPointAnnotation()
                self.temppin.coordinate = tempLocation
            
                self.MapView.addAnnotation(self.temppin)
            }
        }
        
        
        // this sends the request to start fetching the location
        Notifications.postGpsToggled(self, toggle: true)
        
        // init db
        db = FIRDatabase.database().reference()
        
        _refHandle = self.db.child("locations").observe(.childAdded,
                                                        with: { [weak self] (snapshot) -> Void in
                                                            guard let strongSelf = self else { return }
                                                            strongSelf.locations.append(snapshot) })
    }
    
    func postLocationToMap(templocation: CLLocationCoordinate2D) {
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertRectToRegion(rect: MKMapRect) -> MKCoordinateRegion {
        // find center
        return MKCoordinateRegionMake(
            CLLocationCoordinate2DMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height/2),
            MKCoordinateSpan(latitudeDelta: rect.size.width, longitudeDelta: rect.size.height)
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
