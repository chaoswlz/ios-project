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
    //var players: [Player]
    var lobby: Lobby!
    //var lobbySettings = lobby.getSetting()
    
    var prepareTime: Int!
    var gameTime: Int!
    //var result: [Player : String]
    var OutOfBoundsTimer: Timer!
    
    func startGame(){
        
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
    
    //func getPlayers() -> [Player]{
    //    return players
    //}
    
    
    
    func setMap(mapid : Int){
        mapID = mapid
    }
    
    func setSettings(lobbySettings: Dictionary<String, String>){
        settings = lobbySettings
    }
    
    
    func setPrepareTime(time: Int){
        prepareTime =  time
    }
    
    func setGameTime(time: Int){
        gameTime = time
    }
    
    //func setPlayers(players: [Player]){
    
    //}
    
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

