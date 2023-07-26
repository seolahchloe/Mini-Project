//
//  TransitionView.swift
//  AnimationTransition
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isButtonVisible: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 2))) {
                Text("Show/Hide Button")
            }
            .padding()
            
            if isButtonVisible {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.title)
//                .transition(.move(edge: .top))
//                .transition(.slide)
//                .transition(.scale)
//                .transition(.fadeAndMove)
                .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
        }
        .padding()
    }
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        .opacity.combined(with: .move(edge: .top))
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}


