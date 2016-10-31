//
//  SeekerCompass.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class SeekerCompass : PowerUp {
    
    var name : String        = "Compass"
    
    var role : String        = "Seeker"
    
    var duration : Int       = 60 * 1;
    
    var expireTime : Int     = 60 * 5;
    
    var energyCost : Int     = 500;
    
    var isActive : Bool      = false;
    
    var description : String = "Shows the direction the hider is at for a period of time"
    
}
