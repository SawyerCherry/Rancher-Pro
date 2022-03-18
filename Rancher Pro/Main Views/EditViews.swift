//
//  EditViews.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 3/16/22.
//

import SwiftUI

struct EditFarmView: View {
    @ObservedObject var farm: Farm
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        let textBindingFromFarm = Binding(
            get: {
                farm.name!
            }, set: { newName in
                farm.name = newName
            }
        )
        let addressBindingFromFarm = Binding(
            get: {
                farm.address!
            }, set: { newAddress in
                farm.address = newAddress
            }
        )
        Form {
            VStack {
                TextField("Farm Name", text: textBindingFromFarm)
                TextField("Farm Address", text: addressBindingFromFarm)
                Button("Save", action: save)
            }
        }
    }

    func save() {
        try! PersistenceController.shared.container.viewContext.save()

        presentationMode.wrappedValue.dismiss()
    }
}


struct EditHerdView: View {
    @ObservedObject var herd = Herd()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        let nameBindingFromHerd = Binding(
            get: {
                herd.name!
            }, set: { newName in
                herd.name = newName
            }
        )
        Form {
            VStack {
                TextField("change herd name", text: nameBindingFromHerd)
                Button("Save", action: save)
            }
        }
    }

    func save() {
        try! PersistenceController.shared.container.viewContext.save()
        
        presentationMode.wrappedValue.dismiss()
    }
}


struct EditLivestockView: View {
    
    @ObservedObject var livestock: Livestock
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        let tagNumberBindingFromHerd = Binding(
            get: {
                livestock.tagNumber!
            }, set: { newName in
                livestock.tagNumber = newName
            }
        )
        let speciesBindingFromHerd = Binding(
            get: {
                livestock.species!
            }, set: { newName in
                livestock.species = newName
            }
        )
        let sexBindingFromHerd = Binding(
            get: {
                livestock.sex!
            }, set: { newName in
                livestock.sex = newName
            }
        )
        let brthYearBindingFromHerd = Binding(
            get: {
                livestock.birthYear!
            }, set: { newName in
                livestock.birthYear = newName
            }
        )
        
        let breedBindingFromHerd = Binding(
            get: {
                livestock.breed!
            }, set: { newName in
                livestock.breed = newName
            }
        )
        
        let investedBindingFromHerd = Binding(
            get: {
               livestock.amountInvested
            }, set: { newName in
                livestock.amountInvested = newName
            }
        )
        
        Form {
            VStack(alignment: .leading) {
                HStack {
                    Text("Herd name:")
                    TextField("change herd name", text: tagNumberBindingFromHerd)
                }
                
                
                HStack {
                    Text("Species:")
                    Picker("Species", selection: speciesBindingFromHerd) {
                        ForEach(Species.allCases) { species in
                            Text(species.rawValue.capitalized)
                                .foregroundColor(Color.brown)
                                .tag(species)
                        }
                    }.pickerStyle(.menu)
                }
                
                
                
                HStack {
                    Text("Sex of Animal:")
                    Picker("Sex:", selection: sexBindingFromHerd) {
                        ForEach(Sex.allCases) { species in
                            Text(species.rawValue.capitalized)
                                .foregroundColor(Color.brown)
                                .tag(species)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                HStack {
                    Text("Birth Year:")
                    TextField("birth year", text: brthYearBindingFromHerd)
                }
                
                HStack {
                    Text("Amount Invested: ")
                    TextField("amount invested", value: investedBindingFromHerd, format: .number)
                }
                
                HStack {
                    Text("Breed of Animal:")
                    TextField("breed", text: breedBindingFromHerd)
                }
                
                Button("Save", action: save)
                    .padding(.leading, 175)
                
            }
        }
    }

    func save() {
        try! PersistenceController.shared.container.viewContext.save()
        presentationMode.wrappedValue.dismiss()
    }
}
