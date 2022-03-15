//
//  DetailView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI
import CoreData

struct AllFarmsView: View {
    //    let farms = PersistenceController.shared.farms
    //    @FetchedResult() var farms
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Farm.name, ascending: false)],
        animation: .default)
    
    private var farms: FetchedResults<Farm>
    let controller = PersistenceController.shared.container.viewContext
    
    var body: some View {
        NavigationView {
            List {
                ForEach(farms){ farm in
                    VStack {
                        Text("Farm Name: \(farm.name!)")
                        Text("Number of herds: \(farm.getHerdsOnFarm.count)")
                        NavigationLink("Details", destination: FarmDetailView(farm: farm))
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let farm = farms[index]
                        PersistenceController.shared.deleteFarm(farm: farm)
                    }
                    
                })
            }
            .navigationTitle("Farm Details")
        }
    }
    
    
}



struct FarmDetailView: View {
    @ObservedObject var farm: Farm
    var body: some View {
        
        List {
            ForEach(farm.getHerdsOnFarm){ herd in
                VStack {
                    Text("Herd Name: \(herd.name!)")
                    Text("Livestock count in Herd: \(herd.getLivestockOnFarm.count)")
                    NavigationLink("Herd Details", destination: HerdDetailView(herd: herd))
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
                    NavigationLink("Livestock Details", destination: LivestockDetailView(livestock: livestock))
                }
            }
        }
    }
}




