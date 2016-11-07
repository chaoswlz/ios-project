//
//  ViewController.swift
//  ios-project
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import UIKit
import MapKit

// DON'T EXTEND THIS CLASS unless you hook up the MKMapView outlet.
class ViewController: UIViewController {

    @IBOutlet weak var MyMap: MKMapView!
    let notificationCentre = NotificationCenter.default
    let locationManager = CLLocationManager()
    var locationUpdatedObserver : AnyObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
                let templocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
                let temppin : MKPointAnnotation = MKPointAnnotation()
                temppin.coordinate = templocation
                
                self.MyMap.addAnnotation(temppin)
            }
        }
        Notifications.postGpsToggled(self, toggle: true)
        
        //CLLocationCoordinate2D(51, -0.1)
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class BetterPin: MKAnnotationView{}
}

