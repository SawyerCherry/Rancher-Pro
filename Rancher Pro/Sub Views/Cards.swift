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
                Image("barn")
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
    }
}

struct HerdCard: View {
    var herdName: String
    var countInHerd: Int
    var body: some View {
        VStack {
            HStack {
                Text(herdName)
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top)
                    .padding(.horizontal)
                Spacer()
                Image("herd")
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100)
                    .padding(.trailing)
            }
            Text("Livestock Count in Herd: \(countInHerd)")
                .font(.system(size: 20))
                .padding(.bottom)
        }
    }
}

struct HerdCard_Previews: PreviewProvider {
    static var previews: some View {
        HerdCard(herdName: "Wild Cows Herd", countInHerd: 3)
    }
}
