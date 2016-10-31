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
    
    let MAX_USERNAME_LENGTH = 16
    let MAX_TAG_LENGTH = 16
    
    init(userName: String, tag: String){
        self.setUserName(userName: userName)
        self.setTag(tag: tag)
    }
    
    func getUserName() -> String {
        return userName
    }
    
    func getTag() -> String {
        return tag
    }
    
    func getPlayerExperience() -> Int {
        return playerExperience
    }
    
    func getGamesWon() -> Int {
        return gamesWon
    }
    
    func getGamesPlayed() -> Int {
        return gamesPlayed
    }
    
    func getHidersFound() -> Int {
        return hidersFound
    }
    
    //Checks if not nil and has valid length
    func setUserName(userName: String!) -> Bool{
        if(userName != nil && userName.characters.count <= MAX_USERNAME_LENGTH){
            self.userName = userName
            return true
        }
        return false
    }
    
    //Checks if not nil and has valid length    
    func setTag(tag: String!) -> Bool{
        if(tag != nil && tag.characters.count <= MAX_TAG_LENGTH){
            self.tag = tag
            return true
        }
        return false
    }

    //Checks if value is not negative before setting
    func setPlayerExperience(playerExperience: Int!) -> Bool{
        if(playerExperience >= 0){
            self.playerExperience = playerExperience
            return true
        }
        return false
    }
    
    //Checks if value is not negative before setting
    func setGamesWon(gamesWon: Int!) -> Bool{
        if(gamesWon >= 0){
            self.gamesWon = gamesWon
            return true
        }
        return false
    }
    
    //Checks if value is not negative before setting
    func setGamesPlayed(gamesPlayed: Int!) -> Bool{
        if(gamesPlayed >= 0){
            self.gamesPlayed = gamesPlayed
            return true
        }
        return false
    }
    
    //Checks if value is not negative before setting
    func setHidersFound(hidersFound: Int!) -> Bool{
        if(hidersFound >= 0){
            self.hidersFound = hidersFound
            return true
        }
        return false
    }
}
