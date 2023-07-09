//
//  MemberAddView.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import SwiftUI

struct MemberAddView: View {
    // 여기에 굳이 @ObservedObject 프로퍼티 래퍼를 붙이지 않은 이유는
    // 이 뷰에서 memberStore가 바뀌었다해도 뷰를 새로 그릴 필요가 없기 때문이다.
    var memberStore: MemberStore

    @Binding var isShowingSheet: Bool

    @State var name: String = ""
    @State var age: String = ""
    @State var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    TextField("이름", text: $name)
                        .textFieldStyle(.roundedBorder).cornerRadius(6)
                        .font(.title2)
                        .padding(1)
                    TextField("나이", text: $age)
                        .textFieldStyle(.roundedBorder)
                        .font(.title2)
                        .padding(1)
                    Spacer()
                }
                
                TextField("email@email.com", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.gray)
                    .font(.title2)
                    .padding()
            }
            .navigationTitle("Add New Member")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // action
                        isShowingSheet = false
                    } label: {
                        Text("취소")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            // action
                            memberStore.addMember(name: name, age: age, email: email)
                            
                            isShowingSheet = false
                        } label: {
                            Text("추가")
                        }
                    }
                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            // action
//                            isShowingSheet = true
//                        } label: {
//                            Text("추가")
//                        }
//                    }

            }
            
        }
    }
}

struct MemberAddView_Previews: PreviewProvider {
    static var previews: some View {
        MemberAddView(memberStore: MemberStore(),
                      isShowingSheet: .constant(true))
    }
}
