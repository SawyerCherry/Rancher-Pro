//
//  ContentView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 10/18/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    
                    LivestockCard(cowCount: 10)
                    FarmCard(farmName: "Dutton Ranch")
                    
                }
            }
            .padding(.top)
            .navigationTitle("Home").foregroundColor(Color("saddleBrown"))
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
