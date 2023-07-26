//
//  ContentTabView.swift
//  AnimationTransition
//
//  Created by Chloe Chung on 2023/07/26.
//

import SwiftUI

struct ContentTabView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            AutoAnimationView()
                .tabItem {
                    Image(systemName: "film.stack")
                    Text("Animation")
                }
                .tag(1)
            
            TransitionView()
                .tabItem {
                    Image(systemName: "list.and.film")
                    Text("Transition")
                }
                .tag(2)
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
