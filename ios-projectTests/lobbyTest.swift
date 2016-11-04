///Users/a00933336/Desktop/ios-project/ios-project.xcodeproj
//  lobbyTest.swift
//  ios-project
//
//  Created by Jason Cheung on 2016-10-17.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest

class lobbyTest: XCTestCase {
    
    var lobby : Lobby = Lobby()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test1_DefaultGameSettings(){
        
        XCTAssertEqual(lobby.settings.time, 6000)
        XCTAssertEqual(lobby.settings.maxPlayers, 1000)
        XCTAssertEqual(lobby.settings.minPlayers, 2)
        XCTAssertEqual(lobby.settings.gameCode, "1")
        
    }
    
    func test2_EditGameSettings(){
        
        lobby.editSettings(0)
        
        XCTAssertEqual(lobby.settings.time, 6001)
        XCTAssertEqual(lobby.settings.maxPlayers, 10)
        XCTAssertEqual(lobby.settings.minPlayers, 3)
        XCTAssertEqual(lobby.settings.gameCode, "1")
    }
    
    func test3_VariableValidation(){
        
        lobby.editSettings(0)
        
        //Verify the values before changing
        XCTAssertEqual(lobby.settings.time, 6001)
        XCTAssertEqual(lobby.settings.maxPlayers, 10)
        XCTAssertEqual(lobby.settings.minPlayers, 3)
        XCTAssertEqual(lobby.settings.gameCode, "1")
        
        //Try to change to invalid values
        lobby.settings.time = -1
        lobby.settings.minPlayers = -1
        lobby.settings.maxPlayers = -1
        
        XCTAssertEqual(lobby.settings.time, 6001)
        XCTAssertEqual(lobby.settings.maxPlayers, 10)
        XCTAssertEqual(lobby.settings.minPlayers, 3)
        
        //Change to valid values
        lobby.settings.time = 50
        lobby.settings.minPlayers = 5
        lobby.settings.maxPlayers = 15
        
        XCTAssertEqual(lobby.settings.time, 50)
        XCTAssertEqual(lobby.settings.maxPlayers, 15)
        XCTAssertEqual(lobby.settings.minPlayers, 5)
    }
    
    func test4_JoinLobbyInvalidCode() {
        let profile = Profile(userName: "UserName", tag: "GamerTag")
        var lobby: Lobby? = nil
        do {
            lobby = try Lobby.lobbyJoinLobby(profile, "")
        } catch {
            
        }
        XCTAssertNil(lobby)
    }
    
    func test5_JoinLobbyValidCode() {
        let profile = Profile(userName: "UserName", tag: "GamerTag")
        var lobby: Lobby? = nil
        do {
           lobby = try Lobby.lobbyJoinLobby(profile, "1234")!
        } catch {
            
        }
        XCTAssertNotNil(lobby)
    }
}
