//
//  MemberPickView.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import SwiftUI

struct MemberPickView: View {
    
    var memberStore: MemberStore
    
    var body: some View {
        VStack {
            Text("\(memberStore.randomMember.name)")
                .font(.largeTitle)
        }
        .navigationTitle("당신의 선택")
    }
}

struct MemberPickView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberPickView(memberStore: MemberStore())
        }
    }
}
