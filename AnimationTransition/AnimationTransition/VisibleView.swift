//
//  VisibleView.swift
//  AnimationTransition
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct VisibleView: View {
    @State private var visibility: Bool = false
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 1))) {
                Text("Toggle Text Views")
            }
            .padding()
            
            if visibility {
                Text("Hello")
            } else {
                Text("Bye")
                    
            }
        }
        .padding()
        
        
    }
}

struct VisibleView_Previews: PreviewProvider {
    static var previews: some View {
        VisibleView()
    }
}
