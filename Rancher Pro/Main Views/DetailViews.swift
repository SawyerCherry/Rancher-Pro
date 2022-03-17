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
    
    @State var isShowingEditMode = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(farms){ farm in
                    FarmRowView(farm: farm)
                }
            }.navigationTitle("My Farms")
        }
    }
}

struct FarmDetailView: View {
    @ObservedObject var farm: Farm
    @State var isShowingEditMode = false
    var body: some View {
       
        List {
            ForEach(farm.getHerdsOnFarm) { herd in
                HerdRowViews(herd: herd)
            }
                
        }.navigationTitle("My Farms")
    }
    
}


struct HerdDetailView: View {
    @ObservedObject var herd: Herd
    @State private var isShowingEditMode: Bool = false
    var body: some View {
        List {
            ForEach(herd.getLivestockOnFarm) { livestock in
                VStack(alignment: .leading) {
                    Text("Amount invested: $\(livestock.amountInvested, specifier: "%.2f")")
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
        }
        .navigationBarItems(trailing: Button("Edit Herd Details") {
            isShowingEditMode = true
        })
        .sheet(isPresented: $isShowingEditMode, onDismiss: nil) {
            EditHerdView(herd: herd)
        }
        .navigationTitle("Animals in Herd")
    }
}




