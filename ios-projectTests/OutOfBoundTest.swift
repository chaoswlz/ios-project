//
//  OutOfBoundTest.swift
//  ios-project
//
//  Created by Lydia Yu on 2016-10-21.
//  Copyright © 2016 Manjot. All rights reserved.
//
import MapKit
import XCTest
@testable import ios_project
class OutOfBoundTest: XCTestCase{
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testOutOfBounds(){
        
        
        let topCorner = MKMapPoint(x: 0, y: 0)
        let botCorner = MKMapPoint(x: 10.1, y:20.1)
        let tileSize = 1
        let map = Map(topCorner: topCorner, botCorner: botCorner, tileSize: tileSize)

        var p1 =  Player("p1")
        var p2 =  Player("p2")

        //layers: [Player], gameTime: Int
        var game = Game(players: [p1, p2], gameTime: 500)
        
        
        
        /*
         p1.Role =  Seeker()
         p2.Role =  Hider()
         
         
         // p1.Location = Out of map bounds
         //p2.Location = Out of map bounds
         
         w/n the game, if the player's location value exceeds or is lower than the x value of the boundaries
         of the map of the game or the y value is greater than or lower than the bondaries, a message will be displayed.
         Once the player location reaches back into the bounds of the game's map, the message will stop displaying. Once
         the players location is out of bounds, a timer will start and when the time hits 30 seconds, the user will be
         kicked from the game
         
         //Could not finish tests on location, need more info about location from player class.
         
         
         testOutOfBounds(p1, map)
         testOutOfBounds(p2, map)
         
         p1.Location = In bounds
         p2.Location = In bounds
         
         testOutOfBounds(p1, map)
         testOutOfBounds(p2, map)
         
         p1.location = Out of map bounds
         
         testOutOfBounds(p1, map)
         
         var timer = NSTimer.scheduledTimerWithTimeInterval(30, target: self, repeats: false)
         
         //Something should happen (player should be kicked)
         
         XctAssert(???, ???)
         */
    }
    
    
}
