//
//  ZoomGrid.swift
//  ios-project
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class ZoomGrid : Skill {
    
    required init(skillID: Int, skillName : String){
        self.skillID = skillID
        self.skillName = skillName
    }
    
    var skillID: Int
    var skillName: String
    
    var skillPoints: Int = 0
    var skillLevel: Int = 0
    var skillMaxLevel: Int = 5
    var skillIsActive: Bool = false
    var skillEnergyCost: Int = 0
    var skillCooldown: Int = 12000
    var skillDuration: Int = 120
    

    
    func skillDescription() -> String {
        return "Increases the ability you are able to zoom on the grid"
    }
    
//    func skillLevelUp(){
//        skillLevel += 1
//        skillCooldown -= 100
//        skillDuration += 20
//        skillPoints += 1
//    }
    
    func skillIsMax() -> Bool{
        if(skillLevel < skillMaxLevel){
            return false
        }
        return true
    }
    
    func checkLevel() {
        let checkLevel = LevelUp(skill: Skill.self as! Skill)
    
        var result : String
        result = checkLevel.chkLevel()
        
    }
    
}
