//
//  Player.swift
//  ios-project
//
//  Created by Tianyang Liu on 10/17/16.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

public class Player {
    
    var playerName : String
    var level      : Int
    var skill      : Skill
    
    
    public init( _ n : String){
        self.playerName = n
        self.level = 1
        self.skill = ZoomGrid()
    }
    
    public init( _ n : String, _ l : Int){
        self.playerName = n
        self.level = l
        self.skill = ZoomGrid()
    }
    
    public func levelUp() -> String {
        if (level < 99){
            level += 1
            return LevelUp().chkLevel(skill: skill)
        }
        return "Player is max level"
    }
    
    
}
