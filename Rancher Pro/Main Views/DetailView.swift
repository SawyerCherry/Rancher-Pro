//
//  DetailView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
//    let farms = PersistenceController.shared.farms
//    @FetchedResult() var farms
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Farm.name, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Farm>
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(items){ farm in
                    VStack {
                        Text("Farm Name: \(farm.name!)")
                        Text("Number of herds: \(farm.getHerdsOnFarm.count)")
                        NavigationLink("Details", destination: FarmDetailView(farm: farm))
                    }
                }
            }
            .navigationTitle("Farm Details")
            
        }
    }
}

extension Farm {
    var getHerdsOnFarm: [Herd] {
        return herdsOnFarm!.allObjects as! [Herd]
    }
}

extension Herd {
    var getLivestockOnFarm: [Livestock] {
        return livestockInHerd!.allObjects as! [Livestock]
    }
}

struct FarmDetailView: View {
    @ObservedObject var farm: Farm
    
    var body: some View {
        NavigationView {
            List {
                ForEach(farm.getHerdsOnFarm){ herds in
                    VStack {
                        Text("Herd Name: \(herds.name!)")
                        Text("Livestock count in Herd: \(farm.getHerdsOnFarm.count)")
                        NavigationLink("Herd Details", destination: HerdDetailView(herd: herds))
                    }
                }
            }
        }
    }
}
struct HerdDetailView: View {

    @ObservedObject var herd: Herd

    var body: some View {
        List {
            ForEach(herd.getLivestockOnFarm) { livestock in
                VStack {
                    HStack {
                        Text("Livestock Species: \(livestock.species!)")
                        Text("Tag Number: \(livestock.tagNumber!)")
                    }
//                    NavigationLink("Livestock Details", destination: LivestockDetailView(livestock: livestock))
                }
            }
        } 
    }
}

//struct LivestockDetailView: View {
//    var livestock: Livestock
//    var body: some View {
//        ForEach(livestock) { animal in
//            Text("Amount invested: $\(animal.amountInvested)")
//            Text("Tag number: \(animal.tagNumber!)")
//            Text("Species: \(animal.species!)")
//            Text("Sex of animal: \(livestock.sex!)")
//            Text("Breed: \(animal.breed!)")
//            Text("Birth Year: \(animal.birthYear!)")
//        }
//    }
//}
