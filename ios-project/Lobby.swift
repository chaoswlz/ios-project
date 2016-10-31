//
//  Lobby.swift
//  ios-project
//
//  Created by Spencer Joel on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation

class Lobby{
    
    enum LobbyJoinErrors: Error {
        case LobbyFull
        case LobbyCancelled
        case GameStarted
    }
    
    var settings : GameSetting
    var players : [(profile: Profile, isReady: Bool, isSeeker: Bool)] = []
    //will need a host/creater/user variable+

    init() {
        settings = GameSetting()
        // settings.edit() - Allow the user to select the settings for the game
    }
    
    func editSettings(_ x: Int){ // TODO: take a Role later
        settings.edit()
    }
    
    //TODO: Implement these functions
    
    // Starts the game
    func lobbyStart(){}
    
    // Invites a player to the lobby
    func lobbyInvite(_ userName: String) {
        if (userName.isEmpty) {
            return
        }
        
        // var profile = server.findPlayer(userName)
        // profile.notifyInviteGame()
    }
    
    // Kicks a player from the lobby
    func lobbyKick(_ userName: String){}
    
    // Allows the host to change a role of a player in the lobby
    func lobbyChangeRole(_ userName: String, _ role: String){}
    
    // Toggles the current users ready status
    func lobbyToggleReady(){}
    
    // Sets the ready status to false for all players in the lobby
    func lobbyResetReady(){}
    
    // Closes the lobby
    func lobbyCloseLobby(){}
    
    //will need a function to add a player to the players list when that exists
    
    // Update the list when a new player joins the lobby
    func lobbyOnPlayerJoined(newPlayer: Profile) {
        players += [(profile: newPlayer, isReady: false, isSeeker: false)]
    }
    
    // Updates a players ready and seeker status when they change it
    func lobbyOnPlayerStateChanged(userName: String, ready: Bool, seeker: Bool) {
        for var row in players {
            if (row.profile.userName == userName) {
                row.isReady = ready
                row.isSeeker = seeker
            }
        }
    }
    
    
    class func lobbyJoinLobby(_ profile: Profile, _ gameCode: String) throws -> Lobby?{
        
        if (gameCode.isEmpty) {
            return nil
        }
        
        let lobby = Lobby() // server.find.lobby(gameCode)
        
        // check lobby status (players full, lobby canceled, game started)
        if (lobby.players.count == lobby.settings.maxPlayers) {
            throw LobbyJoinErrors.LobbyFull
        }
        // lobby.players += (profile, false, false))
        // server.notifyLobby(lobby)
    
        return lobby
    }
    
    
    class GameSetting{
        
        // MARK: - Fields
        private var _time: Int
        var time: Int{
            get{
                return _time
            }
            set(newValue){
                if (newValue > 0){
                    _time = newValue
                }
            }
        }
        
        private var _maxPlayers: Int
        var maxPlayers: Int {
            get{
                return _maxPlayers
            }
            set(newValue){
                if (newValue >= _minPlayers && newValue >= 2) {
                    _maxPlayers = newValue
                }
            }
        }
        
        private var _minPlayers: Int
        var minPlayers: Int {
            get{
                return _minPlayers
            }
            set(newValue){
                if (newValue <= _maxPlayers && newValue >= 2) {
                    _minPlayers = newValue
                }
            }
        }
        
        private var _gameCode: String
        var gameCode: String {
            get{
                return _gameCode
            }
        }
        
        // TODO: var Boundaries
        
        
        // MARK: - Methods
        init(){
            _time = 6000
            _maxPlayers = 1000
            _minPlayers = 2
            _gameCode = GameSetting.genCode()
        }
        
        //load view to change game settings
        func edit(){
            // test values for now... :
            time = 6001
            maxPlayers = 10
            minPlayers = 3
        }
        
        //change the bounds of the map when that exists
        func changeBounds(){
            // TODO: implement method
        }
        
        class func genCode() -> String{
            return "1"
        }
        
    }
}
