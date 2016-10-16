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
    var mapSize: MKMapSize?
    var mapActual: MKMapRect?
    var map : Map?
    
    init(topCorner: MKMapPoint, botCorner: MKMapPoint, tileSize: Int){
        topLeftPoint = topCorner
        bottomRightPoint = botCorner
        Tile.setTileSize(size: tileSize) //set default value?
    }
    
    func determineDimensions() {
        let tileSize : Int = Tile.getTileSize()
        self.mapSizeX  = bottomRightPoint.x - topLeftPoint.x
        self.mapSizeY = bottomRightPoint.y - topLeftPoint.y
        let xTiles = Int(floor(Double(Int(mapSizeX) / tileSize)))
        let yTiles = Int(floor(Double(Int(mapSizeY) / tileSize)))
        
        initTiles(numTiles: xTiles * yTiles)
    }
    
    func initTiles(numTiles: Int) {
        for i in 1 ... numTiles {
            tiles.insert(Tile(id: i))
        }
    }
    
}
