//
//  Map.swift
//  ios-project
//
//  Created by Dennis on 2016-10-16.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation
import MapKit

class Map {
    var tiles : Set<Tile> = []
    var mapSizeX: Double = 0
    var mapSizeY: Double = 0
    var topLeftPoint: MKMapPoint!
    var bottomRightPoint: MKMapPoint!
    var mapSize: MKMapSize!
    var mapActual: MKMapRect!
    var mapRegion: MKCoordinateRegion?
    static var map : Map?
    
    //not singleton yet
    // TODO Rename parameters to corner1, corner2
    init(topCorner: MKMapPoint, botCorner: MKMapPoint, tileSize: Int){
        // Reformat points if they are invalid.
        let topLeftX = (topCorner.x < botCorner.x) ? topCorner.x : botCorner.x
        let topLeftY = (topCorner.y < botCorner.y) ? topCorner.y : botCorner.y
        let botRightX = (topCorner.x > botCorner.x) ? topCorner.x : botCorner.x
        let botRightY = (topCorner.y > botCorner.y) ? topCorner.y : botCorner.y
        
        let tlp = MKMapPointMake(topLeftX, topLeftY)
        let brp = MKMapPointMake(botRightX, botRightY)
        
        topLeftPoint = tlp
        bottomRightPoint = brp
        
        Tile.setTileSize(size: tileSize) //set default value?
        updateMapDimensions()
    }
    
    func updateMapDimensions() {
        //let tileSize : Int = Tile.getTileSize()
        self.mapSizeX  = bottomRightPoint.x - topLeftPoint.x
        self.mapSizeY = bottomRightPoint.y - topLeftPoint.y
        //let xTiles = Int(floor(Double(Int(mapSizeX) / tileSize)))
        //let yTiles = Int(floor(Double(Int(mapSizeY) / tileSize)))
        
        mapSize = MKMapSize( width: self.mapSizeX, height: self.mapSizeY)
        
        mapActual = MKMapRect(origin: topLeftPoint, size: mapSize!)
        
        // initTiles(numTiles: abs(xTiles * yTiles))
    }
    
    func initTiles(numTiles: Int) {
        for i in 1 ... numTiles {
            tiles.insert(Tile(id: i))
        }
    }
    
    func getTopCorner() -> MKMapPoint {
        return topLeftPoint
    }
    
    func getBotCorner() -> MKMapPoint {
        return bottomRightPoint
    }
    
    func getTileSet() -> Set<Tile> {
        return tiles
    }
    
    func getMapSize() -> MKMapSize {
        return mapSize
    }
    
    func getMapActual() -> MKMapRect {
        return mapActual
    }
    
    
    func setPowerUps(tiles: Set<Tile>, numPowerUps: Int) {
        //        TODO
    }
}
