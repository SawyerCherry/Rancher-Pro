//
//  Rancher_ProApp.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 10/18/21.
//

import SwiftUI

@main
struct Rancher_ProApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TabView {
                AddView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }.tag(1)
                    .foregroundColor(.black)
                //                HomeView()
                //                    .tabItem {
                //                        Image(systemName: "house.circle")
                //                        Text("Home")
                //                    }.tag(1)
                
                AllFarmsView()
                    .tabItem {
                        Image(systemName: "doc.text.image.fill")
                        Text("Detail")
                    }.tag(2)
            }
            
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            
        }
        
    }
}

