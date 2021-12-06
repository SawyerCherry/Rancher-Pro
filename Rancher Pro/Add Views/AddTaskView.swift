//
//  AddTaskView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI

struct AddTaskView: View {
    
    //: MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    @State var taskCompleted: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment:.center, spacing: 73) {
                        Text("Task Title:")
                        TextField("enter", text: $titleText)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack(alignment:.center, spacing: 50) {
                        Text("Task Location:")
                        TextField("enter", text: $descriptionText)
                    }//:STACK
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Spacer()
                        Button {
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
                .navigationTitle("Add A Task")
                .padding()
                .background(Color.brown)
                .cornerRadius(12)
                
                
                Spacer()
            }
            .padding()
            
        
        
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(titleText: "", descriptionText: "", taskCompleted: false)
    }
}
