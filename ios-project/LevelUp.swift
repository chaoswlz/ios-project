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
    
    func chkLevel(skill : Skill) -> String {

        if ( skill.skillMaxLevel != skill.skillLevel )
        {
            skill.skillLevelUp()
            return "Leveled Up!"
        }
        
        return "Skill Is Already Max Level!"
    }
    
    
}
