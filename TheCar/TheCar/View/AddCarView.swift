//
//  AddNewCar.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import SwiftUI

struct AddCarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var carStore: CarStore
    
    // State 값들은 초기화 필수
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    
    var carImageName: String {
        carStore.cars.randomElement()?.imageName ?? "tesla_model_3"
    }
    
    var body: some View {
        Form {
            Section("Car Details") {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInputView(title: "Model", userInput: $name)
                DataInputView(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                
            }
            
            Button {
                addNewCar()
            } label: {
                Text("Add Car")
            }
        }
        .navigationTitle("Add new car")
        
    }
    
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: carImageName)
        carStore.cars.append(newCar)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
}


struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddCarView(carStore: CarStore())
        }
    }
}
