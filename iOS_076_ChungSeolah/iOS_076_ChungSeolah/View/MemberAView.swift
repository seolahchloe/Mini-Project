//
//  IntroView.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/07/02.
//

import SwiftUI

struct MemberAView: View {
    
    @State var isShowingNextAView = false
    @State var selectedMember: Member = team1[0]
    @Binding var selectedMemberA: Int
    
    var body: some View {
        
        VStack {
            Spacer()
            
            //            HStack {
            //            }
            
            List(0..<3) { index in
                
                HStack {
                    
                    AsyncImage(url: URL(string: team1[index].imageURLString)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                        //                    .padding(80)
                        Spacer()
                        
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(team1[index].name)")
                            .bold()
                            .padding(.bottom)
                        
                        Text("공격력: \(team1[index].attackPower)")
                        Text("방어력: \(team1[index].defense)")
                        
                    }
                    
                    HStack {
                        Spacer()
                        Button() {
                            // 버튼 선택한 값을 저장해야 함
                            selectedMemberA = index
                        } label: {
                            Text("선택")
                        }.buttonStyle(.bordered)
                        
                    }
                    
                }
                
            }
            
//            Spacer()
            Text("A팀의 캐릭터: \(team1[selectedMemberA].name)")
                .font(.title)
                .bold()
                .padding(30)
//            Spacer()
            
            Button("닫기") {
                isShowingNextAView = false
            }
        }
        
        
        
    }
}

struct MemberAView_Previews: PreviewProvider {
    static var previews: some View {
        MemberAView(selectedMemberA: .constant(1))
    }
}
