//
//  HiderInvisibility.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class HiderInvisibility : PowerUp {

    var name : String        = "Invisibility"
 
    var role : String        = "Hider"

    var duration : Int       = 60 * 3; // 3 mins
    
    var expireTime : Int     = 60 * 5;
    
    var energyCost : Int     = 500;
    
    var isActive : Bool      = false;
    
    var description : String = "Keeps you hidden from seekers for a period of time"
    
}
