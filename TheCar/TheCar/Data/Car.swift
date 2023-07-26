//
//  Car.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/25.
//

import Foundation
import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}
