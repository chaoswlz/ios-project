//
//  ios_projectTests.swift
//  ios-projectTests
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest
@testable import ios_project

class ios_projectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetMap() {
        let game = Game()
        game.setMap(mapid: 1)
        XCTAssert(game.mapID == 1, "Pass")
    }
    
    func testSetSettings() {
        var settingsTest: Dictionary<String, String>!
        settingsTest = ["key1": "value1"]
        let game = Game()
        game.setSettings(lobbySettings: settingsTest)
        XCTAssert(game.settings == settingsTest, "Pass")
    }
    
    func testSetPrepareTime() {
        let game = Game()
        game.setPrepareTime(time : 10)
        XCTAssert(game.prepareTime == 10, "Pass")
    }
    
    func testSetGameTime() {
        let game = Game()
        game.setGameTime(time: 20)
        XCTAssert(game.gameTime == 20, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

