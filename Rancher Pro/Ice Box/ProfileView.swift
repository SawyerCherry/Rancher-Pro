//
//  ProfileView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI


struct ProfileView: View {

    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 10) {
                Image("rip")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                
                VStack {
                    Text("Rip Wheeler")
                        .font(.largeTitle)
                        
                    Text("Ranch Foreman")
                        .font(.body)
                }
                .padding(.all)
            }
           
        }
        
    }
}


