//
//  Game.swift
//  ios-project
//
//  Created by Lydia Yu on 2016-10-17.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

public class Game{
    var mapID: Int!
    var settings: Dictionary<String, String>!
    var players: [Player]
    var lobby: Lobby!
    //var lobbySettings = lobby.getSetting()
    
    var prepareTime: Int!
    var startTime: Int!
    var gameTime: Int!
    var currentTime: Int!
    //var result: [Player : String]
    var OutOfBoundsTimer: Timer!
    
    
    //start game
    init(PlayerList players: [Player]){
        self.players = players
        startTime = 0;
        gameTime = 2;
        
    }
    

    
    func getMapID() -> Int{
        return mapID
    }
    
    func getSettings() -> Dictionary<String, String>{
        return settings
    }
    
    func getPrepareTime() -> Int{
        return prepareTime
    }
    
    func getGameTime() -> Int{
        return gameTime
    }
    
    func getPlayers() -> [Player]{
        return players
    }
    
    func setMap(mapid : Int){
        mapID = mapid
    }
    
    func setSettings(lobbySettings: Dictionary<String, String>){
        settings = lobbySettings
    }
    
    
    //Checks for end game
    func getPlayerCount(){
        if(players.count<=1){ //refactor to check if player array length instead?
            quitGame();
        }
    }
    func checkHiders(){
        var count = 0;
        for player in players{
            if(player.role is Hider){ //player doesnt have a role yet
                count += 1
            }
        }
        if (count == 0){
            quitGame()
        }
    }
    
    func checkTime(){
        if(currentTime >= (startTime + gameTime)){
            quitGame()
        }
    }
    
    func quitGame(){
        //save stuff
        //reward player
        //return to lobby (killing game)
        
    }
    
    func rewardPlayer(_ Player : Player){
        
    }
    
    
    //func setResult(players: Player){
    
    //}
    /*
     func testOutOfBounds(_: player,_ map)-> String{
     var x = player.location.getX()
     var y = player.location.getY()
     if(x > map.XUpperBoundary || y > map.YUpperBoundary || x < map.XLowerBoundary || y < map.YLowerBoundary){
     player.OutOfBounds = true
     player.BeginTimingForOutOfBounds()
     return "Out of bounds"
     
     }
     }
     
     */
    
    
}

