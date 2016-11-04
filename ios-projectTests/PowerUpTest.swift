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
        
        XCTAssertEqual(180, invisibility.expireTime)
        
        XCTAssertEqual(180, invisibility.energyCost)
        
        XCTAssertEqual(false, invisibility.isActive)
        
        XCTAssertEqual("Keeps you hidden from seekers for a period of time", invisibility.description)
    }
    
    func testCompassValues() {
        let compass = SeekerCompass()
        
        XCTAssertEqual("Compass", compass.name)
        
        XCTAssertEqual("Seeker", compass.role)
        
        XCTAssertEqual(180, compass.duration)
        
        XCTAssertEqual(180, compass.expireTime)
        
        XCTAssertEqual(180, compass.energyCost)
        
        XCTAssertEqual(false, compass.isActive)
        
        XCTAssertEqual("Shows the direction the hider is at for a period of time", compass.description)
    }
    
    func testInvisiblityNegativeValues1(){
        do {
            let _ = try HiderInvisibility.init(duration: -6, expireTime: 500, energyCost: 500, isActive: false)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
        }
        XCTFail("No error thrown!!")
    }
    
    func testInvisiblityNegativeValues2(){
        do {
            let _ = try HiderInvisibility.init(duration: 500, expireTime: -6, energyCost: 500, isActive: false)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
            return
        }
        XCTFail("No error thrown!!")
    }
    
    func testInvisiblityNegativeValues3(){
        do {
            let _ = try HiderInvisibility.init(duration: 500, expireTime: 500, energyCost: -6, isActive: false)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
            return
        }
        XCTFail("No error thrown!!")
    }
    
    func testInvisibilityCorrectValues1(){
        do {
            let invisibility = try HiderInvisibility(duration: 300, expireTime: 300, energyCost: 300, isActive: false)
            XCTAssertEqual("Invisibility", invisibility.name)
            
            XCTAssertEqual("Hider", invisibility.role)
            
            XCTAssertEqual(300, invisibility.duration)
            
            XCTAssertEqual(300, invisibility.expireTime)
            
            XCTAssertEqual(300, invisibility.energyCost)
            
            XCTAssertEqual(false, invisibility.isActive)
            
            XCTAssertEqual("Keeps you hidden from seekers for a period of time", invisibility.description)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
            return
        }
        
        
    }
    
    func testInvisibilityCorrectValues2(){
        do {
            let invisibility = try HiderInvisibility(duration: 500, expireTime: 500, energyCost: 100, isActive: true)
            XCTAssertEqual("Invisibility", invisibility.name)
            
            XCTAssertEqual("Hider", invisibility.role)
            
            XCTAssertEqual(500, invisibility.duration)
            
            XCTAssertEqual(500, invisibility.expireTime)
            
            XCTAssertEqual(100, invisibility.energyCost)
            
            XCTAssertEqual(true, invisibility.isActive)
            
            XCTAssertEqual("Keeps you hidden from seekers for a period of time", invisibility.description)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
            return
        }
        
    }
    
    func testInvisibilityCorrectValues3(){
        do {
            let invisibility = try HiderInvisibility(duration: 12, expireTime: 15, energyCost: 30, isActive: false)
            XCTAssertEqual("Invisibility", invisibility.name)
            
            XCTAssertEqual("Hider", invisibility.role)
            
            XCTAssertEqual(12, invisibility.duration)
            
            XCTAssertEqual(15, invisibility.expireTime)
            
            XCTAssertEqual(30, invisibility.energyCost)
            
            XCTAssertEqual(false, invisibility.isActive)
            
            XCTAssertEqual("Keeps you hidden from seekers for a period of time", invisibility.description)
        }
        catch PowerUpError.illegalArgument{
            return
        }
        catch {
            XCTFail("Wrong error")
            return
        }
        
    }
    
    
}
