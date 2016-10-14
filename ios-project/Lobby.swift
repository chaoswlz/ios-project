//
//  Lobby.swift
//  ios-project
//
//  Created by Spencer Joel on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class Lobby{

    fileprivate var gs : GameSetting
    //will need a variable to hold the list of player tuples (player, ready, seeker)
    //will need a host/creater/user variable
    
    init() {
        gs = GameSetting()
        gs.edit()
    }
    
    func editSettings(_ x: Int){
        gs.edit()
    }
    
    func start(){}
    func invite(){}
    func kick(){}
    func changeRole(){}
    func toggleReady(){}
    func resetReady(){}
    func closeLobby(){}
    
    //will need a function to add a player to the players list when that exists
    
    
    class GameSetting{
        var time: Int
        var maxPlayers: Int
        var minPlayers: Int
        var gameCode: String = ""
        
        init() {
            time = 6000
            maxPlayers = 1000
            minPlayers = 0
            gameCode = genCode()
        }
        
        func genCode() -> String{
            return "1"
        }
        
        func edit(){
            //load view to change everything wrong with this class
            //for now... :
            time = 6001
            maxPlayers = 10
            minPlayers = 3
        }
        
        func getCode() -> String{
            return gameCode
        }
        
        func changeBounds(){
            //change the bounds of the map when that exists
        }
        
    }
}
