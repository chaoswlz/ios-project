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
    
    func test1_DefaultGameSettings() {
        
        XCTAssertEqual(lobby.gs.time, 6000)
        XCTAssertEqual(lobby.gs.maxPlayers, 1000)
        XCTAssertEqual(lobby.gs.minPlayers, 2)
        XCTAssertEqual(lobby.gs.gameCode, "1")
        
    }
    
    func test2_EditGameSettings() {
        
        lobby.editSettings(0)
        
        XCTAssertEqual(lobby.gs.time, 6001)
        XCTAssertEqual(lobby.gs.maxPlayers, 10)
        XCTAssertEqual(lobby.gs.minPlayers, 3)
        XCTAssertEqual(lobby.gs.gameCode, "1")
    }

    
}
