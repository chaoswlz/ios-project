//
//  GameViewController.swift
//  ios-project
//
//  Created by Jason Cheung on 2016-11-04.
//  Copyright © 2016 Manjot. All rights reserved.
//

import UIKit
import MapKit

class GameViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    var map : Map = Map(topCorner: MKMapPoint(x: 49.247815, y: -123.004096), botCorner: MKMapPoint(x: 49.254675, y: -122.997617), tileSize: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Center map on Map coordinates
        MapView.setRegion(convertRectToRegion(rect: map.mapActual), animated: true)
        
        // Disable user interaction 
        MapView.isZoomEnabled = false;
        MapView.isScrollEnabled = false;
        MapView.isUserInteractionEnabled = false;
        
        // Draw pins 
        var pinArray : [MKAnnotation] = []
        for i in 0...5 {
            for j in 0...5 {
                let templocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 49.247815 + (Double(j)/750), longitude: -123.004096 + (Double(i)/750))
                let temppin : MKPointAnnotation = MKPointAnnotation()
                temppin.coordinate = templocation
                pinArray.append(temppin)
            }
            
        }
        MapView.addAnnotations(pinArray)
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
