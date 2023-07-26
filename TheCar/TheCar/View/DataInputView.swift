//
//  DataInputView.swift
//  TheCar
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct DataInputView: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        
        
        }
    }
