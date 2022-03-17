//
//  Extensions.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 3/14/22.
//

import Foundation

extension Farm {
    var getHerdsOnFarm: [Herd] {
        
        guard let herdsOnFarm = herdsOnFarm else {
            return []
        }
        return herdsOnFarm.allObjects as! [Herd]
    }
    
}

extension Herd {
    var getLivestockOnFarm: [Livestock] {
        
        guard let livestockInHerd = livestockInHerd else {
            return []
        }
        return livestockInHerd.allObjects as! [Livestock]
    }
}
