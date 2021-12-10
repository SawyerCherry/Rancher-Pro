//
//  DetailView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/29/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
//    let farms = PersistenceController.shared.farms
//    @FetchedResult() var farms
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Farm.name, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Farm>
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(items){ farm in
                    VStack {
                        Text("Farm Name: \(farm.name!)")
                        Text("Number of herds: \(farm.getHerdsOnFarm.count)")
                        NavigationLink("Details", destination: FarmDetailView(farm: farm))
                    }
                }
            }
            .navigationTitle("Farm Details")
            
        }
    }
}

extension Farm {
    var getHerdsOnFarm: [Herd] {
        return herdsOnFarm!.allObjects as! [Herd]
    }
}

extension Herd {
    var getLivestockOnFarm: [Livestock] {
        return livestockInHerd!.allObjects as! [Livestock]
    }
}

struct FarmDetailView: View {
    @ObservedObject var farm: Farm
    
    var body: some View {
        NavigationView {
            List {
                ForEach(farm.getHerdsOnFarm){ herds in
                    VStack {
                        Text("Herd Name: \(farm.name!)")
                        Text("Livestock count in Herd: \(farm.getHerdsOnFarm.count)")
                        NavigationLink("Livestock Detals", destination: HerdDetailView(herd: herd))
                    }
                }
            }
//            Text("Farm Name: \(farm.name!)")
//            Text("Farm Address: \(farm.address!)")
//
//            List {
//
//                ForEach(farm.getHerdsOnFarm){ herd in
//                    Text(herd.name!)
//                    Text("Livestock Count in Herd: \(herd.getLivestockOnFarm.count)")
//                }
//            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}


struct HerdDetailView: View {
    
    @ObservedObject var herd: Herd
    
    var body: some View {
        NavigationView {
            List {
                ForEach(herd.getLivestockOnFarm){ livestock in
                    VStack {
                        Text("Tag Number: \(livestock.tagNumber!)")
                        Text("Number of herds: \(livestock.amountInvested)")
                    }
                }
            }
            .navigationTitle("Herd Details")
            
        }
    }
}
