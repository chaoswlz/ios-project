//
//  Skill.swift
//  ios-project
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

protocol Skill{
    var skillID : Int { get set }
    var skillName : String { get set }
    
    // skillDuration and skillCooldown represent the timer in seconds
    var skillDuration : Int { get set }
    var skillCooldown : Int { get set }
    
    var skillEnergyCost : Int { get set }
    var skillPoints : Int { get set }
    var skillLevel : Int { get set }
    var skillIsActive : Bool { get set }
    var skillMaxLevel : Int { get set }
    
    func skillDescription() -> String
    
    func skillLevelUp()
    
    func skillIsMax() -> Bool
}
