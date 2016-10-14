//
//  Profile.swift
//  ios-project
//
//  Created by Matthew de Asis on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class Profile {
    
    var userName: String = ""
    var tag: String = ""
    //var skillList: [String] 😀
    
    var playerExperience: Int = 0
    var gamesWon: Int = 0
    var gamesPlayed: Int = 0
    var hidersFound: Int = 0
    
    init(userName: String, tag: String){
        self.userName = userName;
        self.tag = tag;
    }
    
    func getUserName() -> String {
        return userName;
    }
    
    func getTag() -> String {
        return tag;
    }
    
    func getPlayerExperience() -> Int {
        return playerExperience;
    }
    
    func getGamesWon() -> Int {
        return gamesWon;
    }
    
    func getGamesPlayed() -> Int {
        return gamesPlayed;
    }
    
    func getHidersFound() -> Int {
        return hidersFound;
    }
}
