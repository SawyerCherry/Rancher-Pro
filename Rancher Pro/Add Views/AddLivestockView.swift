//
//  AddLivestockView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI
import CoreData

struct AddLivestockView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedSpecies = Species.Cow
    @State private var selectedSex = Sex.Male
    @State var breedText: String = ""
    @State var tagText: String = ""
    @State var birthText: String = ""
    @State var weightText: String = ""
    @State var investmentText: Double = 0.00
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Herd.name, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Herd>
    
    @State var selectedHerd: Herd!
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Add to herd:")
                    Spacer()
                    Picker("Herds", selection: $selectedHerd) {
                        ForEach(items) { herd in
                            Text(herd.name!)
                                .tag(herd as Herd?)
                        }
                    }
                    
                }.padding(.horizontal, 75)
                HStack {
                    Text("Species")
                    Spacer()
                    Picker("Species", selection: $selectedSpecies) {
                        ForEach(Species.allCases) { species in
                            Text(species.rawValue.capitalized)
                                .foregroundColor(Color.brown)
                                .tag(species)
                        }
                    }
                    .pickerStyle(.menu)
                }.padding(.horizontal, 75)
                Divider()
                    .padding(.horizontal, 50)
                
                HStack {
                    Text("Sex")
                    Spacer()
                    Picker("Sex", selection: $selectedSex) {
                        ForEach(Sex.allCases) { sexes in
                            Text(sexes.rawValue.capitalized)
                                .tag(sexes)
                        }
                    }
                }.padding(.horizontal, 75)
                
                Divider()
                    .padding(.horizontal, 50)
                
                HStack {
                    Text("Breed")
    
                    Spacer()
                    TextField("enter", text: $breedText)
                        .fixedSize()
                }.padding(.horizontal, 75)
                
                Divider()
                    .padding(.horizontal, 50)
                
                Group {
                    HStack {
                        Text("Tag #")
                        Spacer()
                        TextField("enter", text: $tagText)
                            .fixedSize()
                    }.padding(.horizontal, 75)
                    Divider()
                        .padding(.horizontal, 50)
                    
                    HStack {
                        Text("Birth Year")
                        Spacer()
                        TextField("enter", text: $birthText)
                            .fixedSize()
                    }.padding(.horizontal, 75)
                    
                    Divider()
                        .padding(.horizontal, 50)
                }
                
                Group {
                    HStack {
                        Text("Approx Weight")
                        Spacer()
                        TextField("enter", text: $weightText)
                            .fixedSize()
                    }.padding(.horizontal, 75)
                    
                    Divider()
                        .padding(.horizontal, 50)
                    
                    HStack {
                        Text("Amount Invested")
                        Spacer()
                        TextField("enter", value: $investmentText, format: .number)
                            .fixedSize()
                                      
                    }.padding(.horizontal, 75)
                    
                    Divider()
                        .padding(.horizontal, 50)
                    
                    Button {
                        // Running this line of code crashes the project
                        PersistenceController.shared.addLivestock(species: selectedSpecies, sex: selectedSex, birthYear: birthText, breed: breedText, tagNumber: tagText, amountInvested: investmentText, into: selectedHerd)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                            .padding(.horizontal, 16)
                            .frame(width: 85, height: 45)
                            .background(Color("saddleBrown"))
                            .foregroundColor(Color.white)
                            .cornerRadius(18)
                            
                    }.padding(.top, 150)
                        
                }
                
                
            }.navigationTitle("Add Livestock")
        }
    
        .onAppear {
            let firstHerd = PersistenceController.shared.firstHerds()!
            self.selectedHerd = firstHerd
        }
    }
}

