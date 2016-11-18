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

class GameViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    let notificationCentre = NotificationCenter.default
    let locationManager = CLLocationManager()
    var locationUpdatedObserver : AnyObject?
    var temppin : MKPointAnnotation = MKPointAnnotation()
    var temppin2 : MKPointAnnotation = MKPointAnnotation()
    
    var tempLocation : CLLocationCoordinate2D?
    var map : Map?
    
    
    var db: FIRDatabaseReference!
    
    var locations: [FIRDataSnapshot]! = []
    
    let username = "hello"
    
    var lat = 0.0
    var long = 0.0
    var lat2 = 0.0
    var long2 = 0.0
    var mapRadius = 0.00486
    var path: MKPolyline = MKPolyline()
    
    fileprivate var _refHandle: FIRDatabaseHandle!
    
//    var map : Map = Map(topCorner: MKMapPoint(x: 49.247815, y: -123.004096), botCorner: MKMapPoint(x: 49.254675, y: -122.997617), tileSize: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MapView.delegate = self
      
        // Center map on Map coordinates
        //MapView.setRegion(convertRectToRegion(rect: map.mapActual), animated: true)
        
        //Disable user interaction
        MapView.isZoomEnabled = false;
        MapView.isScrollEnabled = false;
        MapView.isUserInteractionEnabled = false;
        
        temppin  = MKPointAnnotation()
        temppin2 = MKPointAnnotation()
        
        
        locationUpdatedObserver = notificationCentre.addObserver(forName: NSNotification.Name(rawValue: Notifications.LocationUpdated),
                                                                 object: nil,
                                                                 queue: nil)
        {
            (note) in
            let location = Notifications.getLocation(note)
            
            if let location = location
            {
                self.lat = location.coordinate.latitude
                self.long = location.coordinate.longitude
                self.MapView.removeAnnotation(self.temppin)
                
                // SETTING UP ARRAY OF VALUES TO BE POSTED TO DB
                let mdata : [String: Double] = [
                    "lat": self.lat, "long": self.long
                ]
                
                // POSTING TO DB
                self.db.child("locations").childByAutoId().setValue(mdata)
                
                // POSTING LAT LONG TO MAP
                self.tempLocation  = CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
                
                // DEBUG
                print(self.lat.description + " " + self.long.description)
                // END OF DEBUG
                
                self.temppin = MKPointAnnotation()
                self.temppin.coordinate = self.tempLocation!
            
                self.map = Map(topCorner: MKMapPoint(x: self.lat - self.mapRadius, y: self.long - self.mapRadius), botCorner: MKMapPoint(x: self.lat + self.mapRadius, y: self.long + self.mapRadius), tileSize: 1)
                
                self.MapView.setRegion(self.convertRectToRegion(rect: (self.map?.mapActual)!), animated: true)
                
                self.MapView.addAnnotation(self.temppin)
                
                
                
                // ANOTHER PIN
                if(self.lat2 == 0.0){
                    // set second pin somewhere above and to left of center pin
                    self.lat2 = location.coordinate.latitude + 0.003
                    self.long2 = location.coordinate.longitude - 0.003
                }
                
                // move the pin slowly to the right
                self.long2 = self.long2 + 0.0001
                
                // display second pin
                self.MapView.removeAnnotation(self.temppin2)
                self.tempLocation  = CLLocationCoordinate2D(latitude: self.lat2, longitude: self.long2)
                self.temppin2.coordinate = self.tempLocation!
                self.MapView.addAnnotation(self.temppin2)
                
                // add the "arrow" on the second pin
                self.UnoDirections(pointA: self.temppin, pointB: self.temppin2);
               
            }
        }
        
        
         //this sends the request to start fetching the location
        Notifications.postGpsToggled(self, toggle: true)
        
        //init db
        db = FIRDatabase.database().reference()
        
        _refHandle = self.db.child("locations").observe(.childAdded,
                                                        with: { [weak self] (snapshot) -> Void in
                                                            guard let strongSelf = self else { return }
                                                            strongSelf.locations.append(snapshot) })
    }
    
    func UnoDirections(pointA: MKPointAnnotation, pointB: MKPointAnnotation){

        var coordinates = [CLLocationCoordinate2D]()
        
        let endLat = pointB.coordinate.latitude
        let endLong = pointB.coordinate.longitude
        let startLat = pointA.coordinate.latitude
        let startLong = pointA.coordinate.longitude
        
        let endPointLat = startLat - (startLat - endLat)/10
        let endPointLong = startLong - (startLong - endLong)/10
        
        coordinates += [CLLocationCoordinate2D(latitude: startLat, longitude: startLong)]
        coordinates += [CLLocationCoordinate2D(latitude: endPointLat, longitude: endPointLong)]
        
        // remove previous "arrow"
        self.MapView.remove(path)
        
        // update arrow
        path = MKPolyline(coordinates: &coordinates, count: coordinates.count)
        self.MapView.add(path)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay.isKind(of: MKPolyline.self){
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 1
            return polylineRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
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
