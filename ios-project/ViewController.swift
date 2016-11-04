//
//  ViewController.swift
//  ios-project
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var MyMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.2827, longitude: -123.1207)
//        let pin : MKPointAnnotation = MKPointAnnotation()
//        let location2 : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.2837, longitude: -123.1207)
//        let pin2 : MKPointAnnotation = MKPointAnnotation()
//        let location3 : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.2847, longitude: -123.1207)
//        let pin3 : MKPointAnnotation = MKPointAnnotation()
        //let pin : MKPinAnnotationView = MKPinAnnotationView()
        
//        pin.coordinate = location
//        pin2.coordinate = location2
//        pin3.coordinate = location3
        
        var pinArray : [MKAnnotation] = []
        for i in 0...5 {
            for j in 0...5 {
                let templocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.2827 + (Double(j)/750), longitude: -123.1207 + (Double(i)/750))
                let temppin : MKPointAnnotation = MKPointAnnotation()
                temppin.coordinate = templocation
                pinArray.append(temppin)
            }
            
        }
        MyMap.addAnnotations(pinArray)
        
        //CLLocationCoordinate2D(51, -0.1)
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class BetterPin: MKAnnotationView{}
}

