//
//  File.swift
//  ios-project
//
//  Created by Tianyang Liu on 10/17/16.
//  Copyright © 2016 Manjot. All rights reserved.
//


import XCTest
@testable import ios_project

class PlayerTest2016_10_17: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPlayer(){
        
        let player1 = Player("D'arcy")
        let player2 = Player("Jason")
        
        
        XCTAssertEqual("D'arcy", player1.playerName)
        XCTAssertNotEqual("D'arcy", player2.playerName)
        XCTAssertEqual("Jason" , player2.playerName)
        player2.playerName = "D'arcy"
        XCTAssertEqual("D'arcy", player2.playerName)
        XCTAssertEqual(1, player2.level)
        player2.levelUp();
        XCTAssertEqual(2, player2.level)
        
        let level = player1.levelUp()
        XCTAssertEqual(level, "Leveled Up!")
        
        let level1 = player1.levelUp()
        XCTAssertEqual(level1, "Leveled Up!")
        
        let level2 = player1.levelUp()
        XCTAssertEqual(level2, "Leveled Up!")
        
        let level3 = player1.levelUp()
        XCTAssertEqual(level3, "Leveled Up!")
        
        let level4 = player1.levelUp()
        XCTAssertEqual(level4, "Leveled Up!")
        
        let level5 = player1.levelUp()
        XCTAssertEqual(level5, "Skill Is Already Max Level!")
        
        
        

        
        
    }
}
