//
//  Extensions.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 3/14/22.
//

import Foundation

extension Farm {
    var getHerdsOnFarm: [Herd] {
        return herdsOnFarm!.allObjects as! [Herd]
    }
    
}

extension Herd {
    var getLivestockOnFarm: [Livestock] {
        return livestockInHerd!.allObjects as! [Livestock]
    }
}
