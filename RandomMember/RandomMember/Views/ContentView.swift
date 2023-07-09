//
//  ContentView.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MemberListView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
