//
//  FarmCard.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI

struct FarmCard: View {
    
    //: MARK: - Properties
    
 
    var farmName: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Farms")
                .font(.system(size: 25))
                .padding(.top)
                .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
                .foregroundColor(.black)
             
            
            HStack() {
                VStack(alignment: .leading) {
                    Text("Farm Name: \(farmName)")
                        .font(.system(size: 20))
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
        .background(Color.brown)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct FarmCard_Previews: PreviewProvider {
    static var previews: some View {
        FarmCard(farmName: "Dutton Ranch")
    }
}


struct LivestockCard: View {
    
    //: MARK: - Properties
    
    var cowCount: Int
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Livestock")
                .font(.system(size: 25))
                .padding(.top)
                .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
                .foregroundColor(.black)
             
            
            HStack() {
                Text("Cows: \(cowCount)")
                    .font(.system(size: 20))
                    .padding(.bottom)
                
            }.padding(.horizontal)
        }
        .background(Color.brown)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct LivestockCard_Previews: PreviewProvider {
    static var previews: some View {
        LivestockCard(cowCount: 1)
    }
}


struct RanchHandCard: View {
    
    //: MARK: - Properties
    
    var hands: RanchHand
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Names of Ranch Hands")
                .font(.system(size: 25))
                .padding(.top)
                .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
                .foregroundColor(.black)
             
            
            HStack() {
//                ForEach(hands.name.count) { hand in
//                    Text(hand)
//                        .font(.system(size: 20))
//                        .padding(.bottom)
//                }
                
                
            }.padding(.horizontal)
        }
        .background(Color.brown)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}


