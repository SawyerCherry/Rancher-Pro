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
                HerdRowView(herd: herd)
            }
                
        }.navigationTitle("My Herds")
    }
    
}


struct HerdDetailView: View {
    @ObservedObject var herd: Herd
    @State private var isShowingEditMode: Bool = false
    var body: some View {
        List {
            ForEach(herd.getLivestockOnFarm) { livestock in
                LivestockRowView(livestock: livestock)
            }
        }
        
        .navigationTitle("Animals in Herd")
    }
}




