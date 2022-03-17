//
//  FarmCard.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI

struct FarmCard: View {
    //: MARK: - Properties
    var farm: Farm
    var farmTitle: String
    var numOfHerds: Int
    var farmLocation: String
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(farmTitle)
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top)
                    .padding(.horizontal)
                Spacer()
                Image("bern")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            
            HStack() {
                VStack(alignment: .leading) {
                    
                    Text("Location: \(farmLocation)")
                        .font(.system(size: 20))
                        .padding(.bottom)
                    Text("Number of Herds: \(numOfHerds)")
                        .font(.system(size: 20))
                        .padding(.bottom)
                }
                
            }
        }
        .background(Color.brown)
        .cornerRadius(12)
        .padding(.horizontal)
        
    }
}

struct FarmCard_Previews: PreviewProvider {
    static var previews: some View {
        FarmCard(farm: Farm(), farmTitle: "Sawyer's Farm", numOfHerds: 2, farmLocation: "Whitleyville, TN")
    }
}





