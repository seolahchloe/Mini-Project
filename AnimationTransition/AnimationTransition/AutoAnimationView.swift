//
//  AutoAnimationView.swift
//  AnimationTransition
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct AutoAnimationView: View {
    
//    @State private var rotation: Double = 0.0
    @State private var isSpinning: Bool = true
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.blue)
                    .frame(width: 360, height: 360)
                
                Image(systemName: "forward.fill")
                    .font(.largeTitle)
                    .offset(y: -180)
                    .rotationEffect(.degrees(isSpinning ? 0 : 360))
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isSpinning)
            }
        }
        .padding()
        .onAppear() {
            self.isSpinning.toggle()
        }
    }
}

struct AutoAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AutoAnimationView()
    }
}
