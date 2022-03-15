//
//  AddFarmView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI

struct AddFarmView: View {
    @State var name = ""
    @State var address = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
       
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment:.center, spacing: 73) {
                        Text("Farm name:")
                        TextField("enter", text: $name)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack(alignment:.center, spacing: 53) {
                        Text("Farm Address:")
                        TextField("enter", text: $address)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Spacer()
                        Button {
                            PersistenceController.shared.addFarm(name: name, address: address)
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
                .navigationTitle("Add A Farm")
                .padding()
                .background(Color.brown)
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
            
        
        
        
    }
    

}

struct AddFarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddFarmView()
    }
}
