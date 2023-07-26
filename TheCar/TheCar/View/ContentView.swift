//
//  ContentView.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach (carStore.cars) { car in
                    
                    ListCellView(car: car)
                }
                .onDelete { offsets in
                    deleteItems(at: offsets)
                }
                .onMove { offsets, index in
                    moveItems(from: offsets, to: index)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddCarView(carStore: carStore)
                    } label: {
                        Text("Add")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItems(at offset: IndexSet) {
        carStore.cars.remove(atOffsets: offset)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

