//
//  MemberBView.swift
//  iOS_076_ChungSeolah
//
//  Created by Chloe Chung on 2023/07/04.
//

import SwiftUI

struct MemberBView: View {
    
    @State var isShowingNextAView = false
    @State var isShowingNextBView = false
    @State var selectedMember: Member = team1[0]
    @Binding var selectedMemberB: Int
        
        
        var body: some View {
            
            VStack {
                
                // 0..<team2.count
                List(0..<3) { index in
                    
                    HStack {
                        
                        AsyncImage(url: URL(string: team2[index].imageURLString)) { image in
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
                            
                            Text("\(team2[index].name)")
                                .bold()
                                .padding(.bottom)
                            
                            Text("공격력: \(team2[index].attackPower)")
                            Text("방어력: \(team2[index].defense)")
                            
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button() {
                                // 버튼 선택한 값을 저장해야 함
                                selectedMemberB = index
                            } label: {
                                Text("선택하기")
                            }
                            
                        }
                    }
                    
                }
                Spacer()
                Text("B팀의 캐릭터: \(team2[selectedMemberB].name)")
                    .font(.title)
                    .bold()
                    .padding(30)
                Spacer()
                
                Button("닫기") {
                    isShowingNextBView = false
                }
            }
            
        }
    }


struct MemberBView_Previews: PreviewProvider {
    static var previews: some View {
        MemberBView(selectedMemberB: .constant(1))
    }
}
