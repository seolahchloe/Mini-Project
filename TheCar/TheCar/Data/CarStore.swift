//
//  CarStore.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init (cars: [Car] = []) {
        self.cars = cars
    }
}
