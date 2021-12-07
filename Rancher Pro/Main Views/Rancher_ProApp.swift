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
                HomeView()
                    .tabItem {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }.tag(1)
                    
                DetailView()
                    .tabItem {
                        Image(systemName: "doc.text.image.fill")
                        Text("Detail")
                    }.tag(2)
            }
            
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
         
            
        }
        
    }
}


// CD Stack

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DataModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
            
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func addFarm(name: String, address: String) {
        withAnimation {
            let newFarm = Farm(context: container.viewContext)
            newFarm.name = name
            newFarm.address = address
          

            do {
                try container.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func addHerd(name: String, into farm: Farm) {
        withAnimation {
            let newHerd = Herd(context: container.viewContext)
            newHerd.name = name
            farm.addToHerdsOnFarm(newHerd)
          
            do {
                try container.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
//    func addLivestock(species: Species, sex: Sex, birthYear: String, breed: String, tagNumber: String, amountInvested: String, into herd: Herd) {
//        withAnimation {
//            let newAnimal = Livestock(context: container.viewContext)
//            newAnimal.species = "\(species)"
//            newAnimal.amountInvested = amountInvested
//            newAnimal.sex = "\(sex)"
//            newAnimal.birthYear = birthYear
//            newAnimal.breed = breed
//            newAnimal.tagNumber = tagNumber
//            herd.addToLivestockInHerd(newAnimal)
//            
//        }
//        
//    }
}
