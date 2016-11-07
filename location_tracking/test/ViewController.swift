//
//  ViewController.swift
//  test
//
//  Created by Dennis Chau on 2016-11-04.
//  Copyright © 2016 Dennis Chau. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    
    @IBOutlet weak var label1: UITextField!
    @IBOutlet weak var label2: UITextField!
    let notificationCentre = NotificationCenter.default
    let locationManager = CLLocationManager()
    var locationUpdatedObserver : AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                locationUpdatedObserver = notificationCentre.addObserver(forName: NSNotification.Name(rawValue: Notifications.LocationUpdated),
                                                                         object: nil,
                                                                         queue: nil)
                {
                    (note) in
                    let location = Notifications.getLocation(note)
        
                    if let location = location
                    {
                        self.label1.text = location.coordinate.latitude.description
                        self.label2.text = location.coordinate.longitude.description
                    }
                }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func gpsTogglePressed(_ sender: AnyObject) {
        Notifications.postGpsToggled(self, toggle: true)
    }
    
    @IBAction func offPressed(_ sender: AnyObject) {
        Notifications.postGpsToggled(self, toggle: false)
    }
}


