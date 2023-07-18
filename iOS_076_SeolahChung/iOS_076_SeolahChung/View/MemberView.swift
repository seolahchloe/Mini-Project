//
//  MemberView.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import SwiftUI

struct MemberView: View {
    var memberStore: MemberStore
    var member: Member
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image("\(member.memberImage)")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                
                Text("\(member.name) (\(member.age)세)")
                    .bold()
            }
            .padding()
            Spacer()
            VStack(alignment: .trailing) {
                
                Text("취미: \(member.hobby)")
            }
            Spacer()
        }
        
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(memberStore: MemberStore(),
                   member: Member(name: "신짱구",
                                  memberImage: "zzanggu",
                                  hobby: "예쁜 누나 따라다니기",
                                  age: 5))
    }
}
