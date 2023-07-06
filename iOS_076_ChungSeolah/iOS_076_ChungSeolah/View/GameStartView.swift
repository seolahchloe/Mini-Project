//
//  GameStartView.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/07/02.
//

import SwiftUI

struct GameStartView: View {
    
    
    @State private var showSecondView = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                // 상단 로고 보여주기
                AsyncImage(url: URL(string: logoImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 300)
                        .padding(30)
                    
                } placeholder: {
                    ProgressView()
                }
                
                // 게임 시작하기 버튼
                NavigationLink {
                    GameView()
                } label: {
                    Text("게임 시작하기")
                        
                        .font(.title)
                        .foregroundColor(.cyan)
                        .bold()
                        
                }
                
                // 캐릭터 소개 버튼
                NavigationLink {
//                    MemberAView(selectedMemberA: $memberA)
                } label: {
                    Text("캐릭터 소개보기 👀")
                        .foregroundColor(.indigo)
                }.padding()

            }
        }
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
