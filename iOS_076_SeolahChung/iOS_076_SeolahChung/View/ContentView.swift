//
//  ContentView.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack {
                MemberListView(memberStore: MemberStore())
            }
//            .tabItem {
//                Image(systemName: "plus.circle")
//                Text("Add")
//            }
//            .tag(1)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
