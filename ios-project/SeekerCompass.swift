//
//  SeekerCompass.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class SeekerCompass : PowerUp {
    
    static let DEFAULT_NAME  = "Compass"
    static let DEFAULT_ROLE  = "Seeker"
    static let DEFAULT_DESC  = "Shows the direction the hider is at for a period of time"
    
    var name : String
    var role : String
    var duration : Int
    var expireTime : Int
    var energyCost : Int
    var isActive : Bool
    var description : String
    
    required init(){
        self.name        = SeekerCompass.DEFAULT_NAME
        self.role        = SeekerCompass.DEFAULT_ROLE
        self.description = SeekerCompass.DEFAULT_DESC
        
        self.duration    = 60 * 3
        self.expireTime  = 60 * 3
        self.energyCost  = 60 * 3
        self.isActive    = false
    }
    
    required init(duration: Int, expireTime: Int, energyCost: Int, isActive: Bool) throws{
        self.name        = SeekerCompass.DEFAULT_NAME
        self.role        = SeekerCompass.DEFAULT_ROLE
        self.description = SeekerCompass.DEFAULT_DESC
        
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
