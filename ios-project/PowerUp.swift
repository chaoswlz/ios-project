//
//  PowerUp.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

protocol PowerUp{
    
    // name of the powerup
    var name : String { get set }
    
    // the role the powerup belongs to
    var role : String { get set }
    
    // how long the power up lasts when being used
    var duration : Int { get set }
    
    // how long the power up stays on the map
    var expireTime : Int { get set }
    
    // how much energy the power up costs
    var energyCost : Int { get set }
    
    // true if the player uses the powerup
    var isActive : Bool { get set }
    
    // brief description of the powerup
    var description : String { get set }
    
}
