//
//  ContentView.swift
//  Rotation
//
//  Created by Chloe Chung on 2023/07/25.
//

import SwiftUI

struct PickColor: Identifiable {
    var id: Int
    var color: Color
    var name: String
}

struct ContentView: View {
    var pickColors: [PickColor] = [
        PickColor(id: 0, color: .blue, name: "Blue"),
        PickColor(id: 1, color: .red, name: "red"),
        PickColor(id: 2, color: .yellow, name: "yellow"),
        PickColor(id: 3, color: .green, name: "green")
    ]
    
    @State private var colorIndex: Int = 0
    @State private var roataion: Double = 0.0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(text)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(roataion))
                .animation(.easeInOut(duration: 5),value: roataion)
                .foregroundColor(pickColors[colorIndex].color)

            Slider(value: $roataion, in: 0...360, step: 0.1)
                .padding()
                
            TextField("Enter text here", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Picker(selection: $pickColors, label: (Text("Color"))) {
                ForEach(0..<pickColors.count) { pickColor in
                    Text("\(pickColor.name)")
                        .tag(pickColor.id)
                }
            }
//            .pickerStyle(.wheel)
//            .padding()
            
            Spacer()
            Text("\(roataion)")
                .font(.largeTitle)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
