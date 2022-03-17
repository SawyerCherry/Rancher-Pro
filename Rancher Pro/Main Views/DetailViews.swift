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
                        FarmCard(farm: farm, farmTitle: farm.name!, numOfHerds: farm.getHerdsOnFarm.count, farmLocation: farm.address!)
                        NavigationLink("Farm Details", destination: FarmDetailView(farm: farm))
                            .font(.title3)
                            .padding(.bottom)
                    }
                    .padding()
                    .background(Color("saddleBrown"))
                    .cornerRadius(15)
                    .padding(.vertical)
                    
                    
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let farm = farms[index]
                        PersistenceController.shared.deleteFarm(farm: farm)
                    }
                })
            }
            .navigationTitle("My Farms")
        }
    }
    
    
}



struct FarmDetailView: View {
    @ObservedObject var farm: Farm
    @State var isShowingEditMode = false
    
    var body: some View {
        
        List {
            ForEach(farm.getHerdsOnFarm){ herd in
                VStack {
                    Text("Herd Name: \(herd.name!)")
                    Text("Livestock count in Herd: \(herd.getLivestockOnFarm.count)")
                    NavigationLink("Herd Details", destination: HerdDetailView(herd: herd))
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let herdToDelete = farm.getHerdsOnFarm[index]
                    PersistenceController.shared.deleteHerd(herd: herdToDelete)
                }
            })
        }
        .navigationBarItems(trailing: Button("Edit") {
            isShowingEditMode = true
        })
        .sheet(isPresented: $isShowingEditMode, onDismiss: nil) {
            EditFarmView(farm: farm)
        }
        .navigationTitle("My Farm")
    }
}




struct HerdDetailView: View {
    @ObservedObject var herd: Herd
    var body: some View {
        List {
            ForEach(herd.getLivestockOnFarm) { livestock in
                VStack(alignment: .leading) {
                    Text("Amount invested: $\(livestock.amountInvested)")
                    Text("Tag number: \(livestock.tagNumber!)")
                    Text("Species: \(livestock.species!)")
                    Text("Sex of animal: \(livestock.sex!)")
                    Text("Breed: \(livestock.breed!)")
                    Text("Birth Year: \(livestock.birthYear!)")
                    
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let animal = herd.getLivestockOnFarm[index]
                    PersistenceController.shared.deleteLivestock(livestock: animal)
                }
            })
        }.navigationTitle("Animals in \(herd.name!)")
    }
}




