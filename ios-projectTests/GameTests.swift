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
    
    /*
     * Testing end game conditions
     */
    
    func testGameEndOutOfTime() {
        let player1 = Player("player1")
        let player2 = Player("player2")
        
        //start timer
        let startTime = DispatchTime.now()
        
        //test if game ends after 2 seconds
        let gameLength = 2
        let game = Game(players: [player1, player2], gameTime: gameLength)
        
        //manually set hider because roles not implemented yet
        game.setHidersCount(hiders: 1)
        
        game.startGame()
        
        //end timer
        let endTime = DispatchTime.now()
        let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let timeInterval = Int(nanoTime / 1000000000)
        
        print(timeInterval)
        
        //game ends by out of time
        XCTAssertEqual(gameLength, timeInterval)
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
    
    /*
     * Testing end game rewards
     */
    
    func testNormalGainExp(){
        //Players currently not associated with Profiles
        //Stats aren't being tracked during game run time
        
//        var player1 = Player("player1")
//        var player2 = Player("player2")
//
//        let initialExp = player1.profile.playerExperience
//        
//        let game = Game(players: [player1, player2], gameTime: 1)
//        
//        game.setExp(player1, 20)
//        
//        game.startGame()
//        
//        let finalExp = player1.profile.playerExperience
//        
//        XCTAssertTrue(finalExp, initalExp + 20)
    }
    
    func testNegativeGainExp(){
        var player1 = Player("player1")
        var player2 = Player("player2")
   
        let game = Game(players: [player1, player2], gameTime: 1)
        
        XCTAssertThrowsError(try game.setExp(player: player1, exp: -20))
    }
    
}
