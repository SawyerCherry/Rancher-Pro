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


struct LivestockCard: View {
    
    var amntInvested: Double = 0.00
    var tagNumber: String = ""
    var species: String = ""
    var sex: String = ""
    var breed: String = ""
    var brthYear: String = ""
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Amount invested: $\(amntInvested, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("Tag number: \(tagNumber)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("Species: \(species)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("Sex of animal: \(sex)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("Breed: \(breed)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("Birth Year: \(brthYear)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            Spacer()
            
            Image("livestock")
                .resizable().scaledToFit()
                .frame(width: 100, height: 100)
        }.padding(.horizontal)
    }
}

struct LivestockCard_Previews: PreviewProvider {
    static var previews: some View {
        LivestockCard()
    }
}

