//
//  AddHerdView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI

struct AddHerdView: View {
    //: MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    @State var herdText: String = ""
    @State var locationText: String = ""
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Farm.name, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Farm>
    
    @State var selectedFarm: Farm?
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment:.center, spacing: 73) {
                        Text("Herd name:")
                        TextField("enter", text: $herdText)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    HStack(alignment:.center, spacing: 50) {
                        Text("Herd Location:")
                        Picker("choose a farm", selection: $selectedFarm) {
                            ForEach(items) { farms in
                                Text(farms.name!.capitalized)
                                    .tag(farms as Farm?)
                            }
                        }.disabled(selectedFarm == nil)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                   

                    HStack {
                        Spacer()
                        Button {
                            PersistenceController.shared.addHerd(name: herdText, into: selectedFarm!)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Save")
                                .padding(.horizontal, 16)
                                .frame(width: 85, height: 45)
                                .background(Color("saddleBrown"))
                                .foregroundColor(Color.white)
                                .cornerRadius(18)
                        }//:Button
                   
                        Spacer()
                        
                    }.padding(.top)
                    
                    
                }//:VSTACK
                .navigationTitle("Add A Herd")
                .padding()
                .background(Color.accentColor)

                
                
                Spacer()
            }
            .padding()
            
        }
        
    }
}


