//
//  HiderInvisibility.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class HiderInvisibility : PowerUp {

    static let DEFAULT_NAME  = "Invisibility"
    static let DEFAULT_ROLE  = "Hider"
    static let DEFAULT_DESC  = "Keeps you hidden from seekers for a period of time"
    
    var name : String
    var role : String
    var duration : Int
    var expireTime : Int
    var energyCost : Int
    var isActive : Bool
    var description : String
    
    required init(){
        self.name        = HiderInvisibility.DEFAULT_NAME
        self.role        = HiderInvisibility.DEFAULT_ROLE
        self.description = HiderInvisibility.DEFAULT_DESC
        
        self.duration    = 60 * 3
        self.expireTime  = 60 * 3
        self.energyCost  = 60 * 3
        self.isActive    = false
    }
    
    required init(duration: Int, expireTime: Int, energyCost: Int, isActive: Bool) throws{
        self.name        = HiderInvisibility.DEFAULT_NAME
        self.role        = HiderInvisibility.DEFAULT_ROLE
        self.description = HiderInvisibility.DEFAULT_DESC
        
        if(duration <= 0 || expireTime <= 0 || energyCost <= 0){
            throw PowerUpError.illegalArgument
        }else{
            self.duration    = duration
            self.expireTime  = expireTime
            self.energyCost  = energyCost
            self.isActive    = isActive
        }
    }
    
}
