//
//  LevelUp.swift
//  ios-project
//
//  Created by Haram Lee on 2016-10-21.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation


class LevelUp{
    // this class is example of just leveling up ZoomGrid
    internal var _skill : Skill
    internal let _skillLevel : Int
    internal let _skillMaxLevel : Int
    
    init(skill : Skill ){
        _skill = skill
        _skillLevel = skill.skillLevel
        _skillMaxLevel = skill.skillMaxLevel
    }
    
    func chkLevel() -> String {

        if ( _skillMaxLevel  != _skillLevel)
        {
                        
            _skill.skillLevel += 1
            _skill.skillCooldown -= 100
            _skill.skillDuration += 20
            _skill.skillPoints += 1
            
            return "Leveled Up!"
        }
    
        return "Skill Is Already Max Level!"
    }
    
    
    
    
}
