//
//  AddView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI

import CoreData

class AddViewModel: ObservableObject {
    @Published var numberOfFarms: Int
    @Published var numberOfHerds: Int
    
    var notificationToken: NSObjectProtocol!
    
    init() {
        self.numberOfFarms = PersistenceController.shared.numberOfFarms()
        self.numberOfHerds = PersistenceController.shared.numberOfHerds()
        
        notificationToken = NotificationCenter.default.addObserver(
            forName: NSManagedObjectContext.didChangeObjectsNotification,
            object: nil,
            queue: .main
        ) { _ in
            self.numberOfFarms = PersistenceController.shared.numberOfFarms()
            self.numberOfHerds = PersistenceController.shared.numberOfHerds()
        }
    }
}

struct AddView: View {
    //: MARK: - Properties
    
    @StateObject var model = AddViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                
                NavigationLink("Add Farm", destination: AddFarmView())
                    
                NavigationLink("Add Herd", destination: AddHerdView())
                    .disabled(model.numberOfFarms == 0)
                
                NavigationLink("Add Livestock", destination: AddLivestockView())
                    .disabled(model.numberOfHerds == 0)
                
                // NavigationLink("Add Task", destination: AddTaskView())
                
                
            }
            .navigationTitle("Add")
            .foregroundColor(Color.primary)
            
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
