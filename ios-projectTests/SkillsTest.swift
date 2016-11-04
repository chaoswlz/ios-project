//
//  SkillsTest.swift
//  skillsTest
//
//  Created by Manjot Khalsa on 2016-10-14.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest
@testable import ios_project

class SkillsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testZoomGrid() {
        let zoomgrid = ZoomGrid(skillID: 1,skillName: "ZoomGrid")
        // testing description
        XCTAssertEqual(zoomgrid.skillDescription(), "Increases the ability you are able to zoom on the grid")
        
        // testing skillIsMax to check if the skill has been upgraded to max level already
        XCTAssertEqual(zoomgrid.skillIsMax(), false)
        
        zoomgrid.checkLevel()
        
        var actual = (zoomgrid.skillLevel, zoomgrid.skillCooldown, zoomgrid.skillDuration, zoomgrid.skillPoints)
        let expected1 = (1, 11900, 140, 1)
        testLevelUp(expected1, actual)
        XCTAssertEqual(zoomgrid.skillIsMax(), false)
        
        zoomgrid.checkLevel()
        actual = (zoomgrid.skillLevel, zoomgrid.skillCooldown, zoomgrid.skillDuration, zoomgrid.skillPoints)
        let expected2 = (2, 11800, 160, 2)
        testLevelUp(expected2, actual)
        
        
        
        zoomgrid.checkLevel()
        actual = (zoomgrid.skillLevel, zoomgrid.skillCooldown, zoomgrid.skillDuration, zoomgrid.skillPoints)
        let expected3 = (3, 11700, 180, 3)
        testLevelUp(expected3, actual)
        
        zoomgrid.checkLevel()
        actual = (zoomgrid.skillLevel, zoomgrid.skillCooldown, zoomgrid.skillDuration, zoomgrid.skillPoints)
        let expected4 = (4, 11600, 200, 4)
        testLevelUp(expected4, actual)
        
        XCTAssertEqual(zoomgrid.skillIsMax(), false)
        
        zoomgrid.checkLevel()
        actual = (zoomgrid.skillLevel, zoomgrid.skillCooldown, zoomgrid.skillDuration, zoomgrid.skillPoints)
        let expected5 = (5, 11500, 220, 5)
        testLevelUp(expected5, actual)
        
        XCTAssertEqual(zoomgrid.skillIsMax(), true)
        
    }
    func testLevelUp(_ expected : (level: Int, cooldown: Int, duration: Int, points: Int) ,_ actual:(level: Int, cooldown: Int, duration: Int, points: Int)){
        XCTAssertEqual(expected.level, actual.level)
        XCTAssertEqual(expected.cooldown, actual.cooldown)
        XCTAssertEqual(expected.duration, actual.duration)
        XCTAssertEqual(expected.points, actual.points)
    }
    
}
