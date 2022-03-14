//
//  CoreDataManager.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 3/14/22.
//

import Foundation
import SwiftUI
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
    
    func numberOfFarms() -> Int {
        let fetch = Farm.fetchRequest()
        return (try? container.viewContext.fetch(fetch).count) ?? 0
    }
    
    func addFarm(name: String, address: String) {
        withAnimation {
            let newFarm = Farm(context: container.viewContext)
            newFarm.name = name
            newFarm.address = address
            
            save()
        }
    }
    
    func numberOfHerds() -> Int {
        let fetch = Herd.fetchRequest()
        return (try? container.viewContext.fetch(fetch).count) ?? 0
    }
    
    func addHerd(name: String, into farm: Farm) {
        withAnimation {
            let newHerd = Herd(context: container.viewContext)
            newHerd.name = name
            farm.addToHerdsOnFarm(newHerd)
            
            save()
        }
    }
    
    func addLivestock(species: Species, sex: Sex, birthYear: String, breed: String, tagNumber: String, amountInvested: Double, into herd: Herd) {
        withAnimation {
            let newAnimal = Livestock(context: container.viewContext)
            newAnimal.species = "\(species)"
            newAnimal.amountInvested = amountInvested
            newAnimal.sex = "\(sex)"
            newAnimal.birthYear = birthYear
            newAnimal.breed = breed
            newAnimal.tagNumber = tagNumber
            herd.addToLivestockInHerd(newAnimal)
            
            save()
        }
    }
    
    func firstFarms() -> Farm? {
        let fetch = Farm.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(keyPath: \Farm.name, ascending: false)]
        fetch.fetchLimit = 1
        guard let result = try? container.viewContext.fetch(fetch).first else {
            return nil
        }
        
        return result
    }
    
    func firstHerds() -> Herd? {
        let fetch = Herd.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(keyPath: \Herd.name, ascending: false)]
        fetch.fetchLimit = 1
        guard let result = try? container.viewContext.fetch(fetch).first else {
            return nil
        }
        return result
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteFarm(farm: Farm, herd: Herd, livestock: Livestock) {
        container.viewContext.delete(farm)
        container.viewContext.delete(herd)
        container.viewContext.delete(herd)
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
