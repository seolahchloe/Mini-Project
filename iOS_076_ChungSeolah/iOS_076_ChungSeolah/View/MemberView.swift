//
//  ZzangguView.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/06/30.
//

import SwiftUI

struct MemberView: View {
    
    var member: Member
    @State var selectedMember: Member = team2[1]
    @State private var isSelected = false
    
    
    var body: some View {
        
        VStack {
            Spacer()
            AsyncImage(url: URL(string: "\(member.imageURLString)")) {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
 
                
            } placeholder: {
                ProgressView()
            }
            
            
            Form {
                Text("이름 : \(selectedMember.name)")
                Text("공격력 : \(selectedMember.attackPower * 10)%")
                Text("방어력 : \(selectedMember.defense * 10)%")
            }
            
            
            // 캐릭터 선택하기 버튼
            Button {
                isSelected = true
                
            } label: {
                Text("\(member.name)로 선택하기")
            }
            

        }
        
    }
    
}


struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(member: team2[1], selectedMember: team2[1])
    }
}
