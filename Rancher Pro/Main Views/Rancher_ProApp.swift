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

// MARK: TODO

// KEYS: Completed ✅ In Progress 🛠

// DELETE functionality
// 1. when you delete a farm, delete all herds and delete all livestock too: In Progress 🛠
// 2. when you delete a herd, delete all livestock under that herd too
// 3. when you delete a singular livestock ??????

// UPDATE functionality
// create edit view for farm details
// create edit view for herd details
// create edit view for livestock details

// UI Changes
// fix the forms for farm
// fix the forms for herd
// fix the forms for livestock
// make the app responsive to darkmode or turn it off and use custom color scheme
// create onboarding pages and cache a user's name to display on home page


// Ship to testflight
// fully test the delete/ edit features
// archive a build
// release to testflight

// EXTRAS
// find a new app icon
// research new color schemes
// build out a home view and cache the user's name somewhere in the onboarding screens


// OTHER REQUIRED
// update slides with completed work
// keep tracker updated
// regurarly commit to github
// work on the pitch
// download to phone and present screen


// Bugs:

//1. App crashes when we delete the farm, because it can't find herds?
//2. I will run into the same thing when trying to delete herd
