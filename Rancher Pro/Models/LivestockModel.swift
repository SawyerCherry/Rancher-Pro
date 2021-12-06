//
//  LivestockModel.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import Foundation
import SwiftUI

enum Species: String, Identifiable, CaseIterable {
    case Cow = "Cow"
    case Horse = "Horse"
    case Donkey = "Donkey"
    case Mule = "Mule"
    case Llama = "Llama"
    case Sheep = "Sheep"
    case Goat = "Goat"
    case Pig = "Pig"
    case Turkey = "Turkey"
    case Chicken = "Chicken"
    
    var id: String { self.rawValue }
}

enum Sex: String, Identifiable, CaseIterable {
    case Male = "Male"
    case Female = "Female"
    
    var id: String { self.rawValue }
}

//struct Livestock {
//    var species: String
//    var sex: String
//    var breed: String
//    var tagNumber: Int?
//    var dateOfBirth: Date
//    var amountInvested: Double
//}
