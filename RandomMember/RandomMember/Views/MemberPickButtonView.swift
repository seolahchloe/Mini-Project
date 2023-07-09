//
//  MemberPickButtonView.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import SwiftUI

struct MemberPickButtonView: View {
    // memberStore가 바뀌면 새로 바디를 그려줘야 하는 곳에만 @ObservedObject를 붙이면 된다.
    @ObservedObject var memberStore: MemberStore
    
    var body: some View {
        
        NavigationLink {
            MemberPickView(memberStore: memberStore)
        } label: {
            HStack {
                Spacer()
                Label("선택", systemImage: "hand.tap")
                Spacer()
            }
            .padding()
        }
        .disabled(memberStore.membersEmpty)
        .buttonStyle(.bordered)
        .tint(.accentColor)
        .padding()
    }
}

struct MemberPickButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MemberPickButtonView(memberStore: MemberStore())
    }
}
