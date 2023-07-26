//
//  ListCell.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct ListCellView: View {
    var car: Car
    
    var body: some View {
        NavigationLink {
            CarDetailView(selectedCar: car)
        } label: {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
