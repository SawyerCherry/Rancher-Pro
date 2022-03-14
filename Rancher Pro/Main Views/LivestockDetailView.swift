//
//  LivestockDetailView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 3/14/22.
//

import SwiftUI

struct LivestockDetailView: View {
    @ObservedObject var livestock: Livestock
    
    var body: some View {
        List {
            Text("Amount invested: $\(livestock.amountInvested)")
            Text("Tag number: \(livestock.tagNumber!)")
            Text("Species: \(livestock.species!)")
            Text("Sex of animal: \(livestock.sex!)")
            Text("Breed: \(livestock.breed!)")
            Text("Birth Year: \(livestock.birthYear!)")
        }
    }
}

struct LivestockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LivestockDetailView(livestock: Livestock())
    }
}
