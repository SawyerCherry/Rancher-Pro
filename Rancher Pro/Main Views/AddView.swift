//
//  AddView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI

struct AddView: View {
    //: MARK: - Properties
    
    @State private var addLivestock: Bool = false
    @State private var addHerd: Bool = false
    @State private var addFarm: Bool = false
    @State private var addHand: Bool = false
    @State private var addTask: Bool = false
    
    
    var body: some View {
        
        NavigationView {
            List {
                
                NavigationLink("Add Farm", destination: AddFarmView())
                    
                NavigationLink("Add Herd", destination: AddHerdView())
                
                NavigationLink("Add Livestock", destination: AddLivestockView())
                
                // NavigationLink("Add Task", destination: AddTaskView())
                
                
            }.navigationTitle("Add")
                .foregroundColor(Color.primary)
            
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
