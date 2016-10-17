		//
//  Tile.swift
//  ios-project
//
//  Created by Dennis on 2016-10-16.
//  Copyright © 2016 Manjot. All rights reserved.
//

import Foundation
        
class Tile : Equatable, Hashable {
    var tileId : Int!
    static var tileSize: Int!
//    var powerUp : PowerUp = nil
    
    init(id: Int){
        tileId = id
    }
    
    // make tile equatable
    static func ==(lhs: Tile, rhs: Tile) -> Bool {
        return lhs.tileId == rhs.tileId
    }

    //make tile hashable
    var hashValue: Int {
        get {
            return tileId.hashValue
        }
    }
    
    static func setTileSize(size: Int){
        Tile.tileSize = size;
    }
    
    static func getTileSize() -> Int {
        return Tile.tileSize;
    }

}
