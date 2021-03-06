//
//  RowView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI

struct FarmRowView: View {
    //: MARK: - Properties
    var farm: Farm
    @State private var isShowingEditMode: Bool = false
    var body: some View {
       
        VStack {
            FarmCard(farm: farm, farmTitle: farm.name!, numOfHerds: farm.getHerdsOnFarm.count, farmLocation: farm.address!)
            
            NavigationLink("Farm Details", destination: FarmDetailView(farm: farm))
                .font(.title3)
                .padding(.bottom)
               
        }
        .swipeActions {
            //delete button
            Button(role: .destructive) {
                PersistenceController.shared.deleteFarm(farm: farm)
            } label:  {
                Label("Delete", systemImage: "trash.circle.fill")
            }
            
            //edit button
            Button {
                isShowingEditMode = true
            } label:  {
                Label("Edit", systemImage: "pencil.circle.fill")
            }
            .tint(.orange)
        }
        .sheet(isPresented: $isShowingEditMode) {
            EditFarmView(farm: farm)
        }
    }
}


struct HerdRowView: View {
    
    @State private var isShowingEditMode: Bool = false
    var herd: Herd
    
    var body: some View {
        
            VStack {
                HerdCard(herdName: herd.name!, countInHerd: herd.getLivestockOnFarm.count)
                NavigationLink("Herd Details", destination: HerdDetailView(herd: herd))
            }
            .swipeActions {
                //delete button
                Button(role: .destructive) {
                    PersistenceController.shared.deleteHerd(herd: herd)
                } label:  {
                    Label("Delete", systemImage: "trash.circle.fill")
                }
                //edit button
                Button {
                    isShowingEditMode = true
                } label:  {
                    Label("Edit", systemImage: "pencil.circle.fill")
                }
                .tint(.orange)
            }
            .sheet(isPresented: $isShowingEditMode) {
                EditHerdView(herd: herd)
            }
            
       
    }
}


struct LivestockRowView: View {
    @State private var isShowingEditMode: Bool = false
    var livestock: Livestock
    var body: some View {
        VStack {
            LivestockCard(amntInvested: livestock.amountInvested, tagNumber: livestock.tagNumber!, species: livestock.species!, sex: livestock.sex!, breed: livestock.breed!, brthYear: livestock.birthYear!)
        }
        .swipeActions {
            Button(role: .destructive) {
                PersistenceController.shared.deleteLivestock(livestock: livestock)
            } label: {
                Label("Delete", systemImage: "trash.circle.fill")
            }
            
            Button {
                isShowingEditMode = true
            } label:  {
                Label("Edit", systemImage: "pencil.circle.fill")
            }
            .tint(.orange)
        }
        .sheet(isPresented: $isShowingEditMode) {
            EditLivestockView(livestock: livestock)
        }
    }
}
