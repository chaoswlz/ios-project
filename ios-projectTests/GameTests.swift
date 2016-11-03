//
//  GameTests.swift
//  ios-project
//
//  Created by Dennis on 2016-11-02.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest

@testable import ios_project

class GameTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameEndOutOfTime() {
        let player1 = Player("player1")
        let player2 = Player("player2")
        
        let game = Game(players: [player1, player2], gameTime: 2)
        
        //manually set hider because roles not implemented yet
        game.setHidersCount(hiders: 1)
        
        game.startGame()
        
        //game ends by out of time
        XCTAssertEqual(true, game.triggerGameTime)
        XCTAssertEqual(false, game.triggerPlayerCount)
        XCTAssertEqual(false, game.triggerZeroHiders)
    }
    
    func testGameEndOutOfHiders() {
        let player1 = Player("player1")
        let player2 = Player("player2")
        
        let game = Game(players: [player1, player2], gameTime: 2)
        game.setHidersCount(hiders: 0)
        
        game.startGame()
        
        //game ends by no more hiders
        XCTAssertEqual(false, game.triggerGameTime)
        XCTAssertEqual(false, game.triggerPlayerCount)
        XCTAssertEqual(true, game.triggerZeroHiders)
    }
    
    func testGameEndOutofPlayers(){
    
        let game = Game(players: [], gameTime: 2)
        game.setHidersCount(hiders: 1)
    
        game.startGame()
    
        //game ends by no more hiders
        XCTAssertEqual(false, game.triggerGameTime)
        XCTAssertEqual(true, game.triggerPlayerCount)
        XCTAssertEqual(false, game.triggerZeroHiders)
    }
    
    func testGainExp(){
        //Players currently not associated with Profiles
    }
    
    
}
