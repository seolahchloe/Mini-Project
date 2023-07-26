//
//  ContentView.swift
//  AnimationTransition
//
//  Created by Chloe Chung on 2023/07/26.
//

// 암묵적, 명시적, 자동, 전환 애니메이션

import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Button { withAnimation(.linear(duration: 2)) {
                // 명시적 animation - rotation에 대해서만 애니메이션을 건다
                rotation = rotation < 360 ? rotation + 60 : 0
            }
                scale = scale < 2.8 ? scale + 0.3 : 1
            } label: {
                Text("Click to animate")
                    .scaleEffect(scale)
//                    .font(.largeTitle)
                    .rotationEffect(.degrees(rotation))
//                    .animation(.linear(duration: 0.1), value: rotation)
                    .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation)
            }
            Spacer()
            Text("\(rotation)")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
