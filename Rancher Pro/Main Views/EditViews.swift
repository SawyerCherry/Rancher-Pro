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
    @ObservedObject var herd: Herd

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
