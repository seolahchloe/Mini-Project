//
//  GameView.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/07/02.
//

import SwiftUI



struct GameView: View {
    
    @State var isShowingNextAView = false
    @State var isShowingNextBView = false
    @State private var isSelected = false
    
    @State var memberA: Int = 0
    @State var memberB: Int = 0
    
    @State var instruction: String = "그림을 눌러 캐릭터를 선택해주세요"
    
    var body: some View {

        VStack {
            
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
            
            VStack {
                
                
                Text("\(instruction)")
                    .font(.title2)
                
                Spacer()
                
                
                // 선택된 캐릭터 이미지 보여주기
                // default - 부리부리자에몽
                HStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            isShowingNextAView = true
                        } label: {
                            Image(team1[memberA].name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10) // 테두리 효과를 주기 위한 RoundedRectangle
                                        .stroke(Color.blue, lineWidth: isSelected ? 4 : 0) // isSelected에 따라 테두리 두께 결정
                                )
                        }
                        .sheet(isPresented: $isShowingNextAView) {
                            MemberAView(selectedMemberA: $memberA)
                        }
                        
                    }
                    
                    
                    Button {
                        isShowingNextBView = true
                    } label: {
                        Image(team2[memberB].name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .clipShape(Circle())
                    }
                    .sheet(isPresented: $isShowingNextBView) {
                        MemberBView(selectedMemberB: $memberB)
                    }
                    
                    Spacer()
                    
                } // HStack
                
                
                // 선택된 캐릭터 이름 보여주기
                HStack {
                    
                    Spacer()
                    
                    Text("\(team1[memberA].name)")
                        .font(.title)
                        .bold()
                        .padding(30)
                        
                    //
                    Text("vs.")
                    
                    Text("\(team2[memberB].name)")
                        .font(.title)
                        .bold()
                        .padding(30)
                    
                    Spacer()
                }
                .padding()
                
                
                
                // 공격 버튼 만들기
                    Button {
                        instruction = fight(player1: team1[memberA], player2: team2[memberB])
                    } label: {
                        Text("게임 시작")
                            .buttonStyle(.borderedProminent)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
          
            }
        }
    }
}





struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
