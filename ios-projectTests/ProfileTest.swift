//
//  ProfileTest.swift
//  ios-project
//
//  Created by Matthew de Asis on 2016-10-17.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest
@testable import ios_project

class ProfileTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
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
    
    func testInit(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertEqual("John", p.getUserName())
        XCTAssertEqual("Doe", p.getTag())
        
        let p2 = Profile(userName:"aaaaaaaaaaaaaaaaaa", tag:"aaaaaaaaaaaaaaaaaaa")
        XCTAssertEqual("", p2.getUserName())
        XCTAssertEqual("", p2.getTag())
        
    }
    
    func testUserName(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setUserName(userName: "FirstTest"))
        XCTAssertEqual("FirstTest", p.getUserName())
        
        XCTAssertFalse(p.setUserName(userName: nil))
        
        XCTAssertFalse(p.setUserName(userName: "aaaaaaaaaaaaaaaaa"))
        
    }
    
    func testTag(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setTag(tag: "FirstTest"))
        XCTAssertEqual("FirstTest", p.getTag())
        
        XCTAssertFalse(p.setTag(tag: nil))
        
        XCTAssertFalse(p.setTag(tag: "aaaaaaaaaaaaaaaaa"))
        
    }
    
    func testPlayerExperience(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setPlayerExperience(playerExperience: 100))
        XCTAssertFalse(p.setPlayerExperience(playerExperience: -1))
        XCTAssertEqual(100, p.getPlayerExperience())
        
    }
    
    func testGamesWon(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setGamesWon(gamesWon: 100))
        XCTAssertFalse(p.setGamesWon(gamesWon: -1))
        XCTAssertEqual(100, p.getGamesWon())
        
    }
    
    func testGamesPlayed(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setGamesPlayed(gamesPlayed: 100))
        XCTAssertFalse(p.setGamesPlayed(gamesPlayed: -1))
        XCTAssertEqual(100, p.getGamesPlayed())
        
    }
    
    func testHidersFound(){
        let p = Profile(userName:"John", tag:"Doe")
        XCTAssertTrue(p.setHidersFound(hidersFound: 100))
        XCTAssertFalse(p.setHidersFound(hidersFound: -1))
        XCTAssertEqual(100, p.getHidersFound())
        
    }

    
}
