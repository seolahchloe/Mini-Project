//
//  MemberListView.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import SwiftUI

struct MemberListView: View {
    
    // @ObservedObject가 @Published를 관찰했다가 memberStore를 body에 다시 그려준다
    
    @ObservedObject var memberStore: MemberStore = MemberStore()
    
    @State var isShowingSheet: Bool = false
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        VStack {
            List(memberStore.members) { member in
                
                    Text("이름: \(member.name)  /  나이: \(member.age)")
                    Text("이메일: \(member.email)")
                
            }
            
            MemberPickButtonView(memberStore: memberStore)

        }
        .navigationTitle("Members")
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    if memberStore.members.count > 0 {
                        memberStore.members.remove(at: 0)
                    } else {
                        return isShowingAlert = true
                    }
                } label: {
                    Label("삭제", systemImage: "minus.circle")
                }
            }
            
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // action
                    isShowingSheet = true
                } label: {
                    Label("추가", systemImage: "plus.circle")
                }
            }

        }
        .sheet(isPresented: $isShowingSheet) {
            // memberStore는 class로 만들어서 참조타입으로 전달되지만
            // isShowingSheet는 struct로 만든 Bool이라서 값타입으로 전달되니까
            // 바인딩을 걸어서 억지로 참조타입처럼 해줄 필요가 있다. (방법은 $ 붙이기)
            MemberAddView( memberStore: memberStore,
                          isShowingSheet: $isShowingSheet)
        }
        .alert(isPresented: $isShowingAlert) {
            // 확인, 취소 버튼 있는 선택/경고창은 이 내용 고쳐서 활용하면 됩니다
            Alert(title: Text("삭제할 멤버가 없습니다."),
                  message: Text("멤버를 추가하세요"),
                  primaryButton: .destructive(Text("Return")) {
                        MemberAddView(memberStore: memberStore, isShowingSheet: $isShowingSheet)
                    },
                  secondaryButton: .cancel())
        }
        
        }
        
    }


struct MemberListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberListView()
        }
    }
}
