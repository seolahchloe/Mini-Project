//
//  ContentView.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import SwiftUI

// 탭 같은 기능이 생기면 ContentView는 그것만으로 복잡해질 수 있기 때문에
// ÇontentView에 다 담지 말고
// 최소의 기능만 담는것이 좋다
// 여기엔 NavigationStack만
struct ContentView: View {
    @State var tabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack {
                StickerListView()
            }
            .tabItem {
                Image(systemName: "note")
                Text("Stickers")
            }
            .tag(1)
            
            
            Text("스티커앱")
                .tabItem {
                    Image(systemName: "person")
                    Text("About")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
