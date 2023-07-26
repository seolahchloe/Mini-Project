//
//  CarDetailView.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import SwiftUI

struct CarDetailView: View {
    
    let selectedCar: Car
    
    var hybridImageName: String {
        selectedCar.isHybrid ?
             "checkmark.circle" : "xmark.circle"
    }
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: hybridImageName)
                }
            }
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(selectedCar: carData[0])
    }
}
