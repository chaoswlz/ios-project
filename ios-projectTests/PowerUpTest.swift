//
//  PowerUpTest.swift
//  ios-project
//
//  Created by Kevin Le on 2016-10-19.
//  Copyright © 2016 Manjot. All rights reserved.
//

import XCTest
@testable import ios_project

class PowerUpTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInvisibilityValues() {
        let invisibility = HiderInvisibility()

        XCTAssertEqual("Invisibility", invisibility.name)
        
        XCTAssertEqual("Hider", invisibility.role)
        
        XCTAssertEqual(180, invisibility.duration)
        
        XCTAssertEqual(300, invisibility.expireTime)
        
        XCTAssertEqual(500, invisibility.energyCost)
        
        XCTAssertEqual(false, invisibility.isActive)
        
        XCTAssertEqual("Keeps you hidden from seekers for a period of time", invisibility.description)
    }
    
    func testCompassValues() {
        let compass = SeekerCompass()
        
        XCTAssertEqual("Compass", compass.name)
        
        XCTAssertEqual("Seeker", compass.role)
        
        XCTAssertEqual(60, compass.duration)
        
        XCTAssertEqual(300, compass.expireTime)
        
        XCTAssertEqual(500, compass.energyCost)
        
        XCTAssertEqual(false, compass.isActive)
        
        XCTAssertEqual("Shows the direction the hider is at for a period of time", compass.description)
    }
    
    
}
