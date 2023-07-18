//
//  MemberAddView.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import SwiftUI

struct MemberAddView: View {
    var memberStore: MemberStore
    
    @Binding var isShowingAddSheet: Bool
    
    @State var name: String
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                // MARK: Select Profile Image 만들기
                
                
                HStack {
                    Text("이름: ")
                    TextField(
                        "이름을 입력하세요",
                        text: $name
                        )
                }

                
                HStack {
                    Text("나이: ")
                    TextField(
                        "나이를 입력하세요",
                        text: $name
                        )
                }
                
                HStack {
                    Text("취미: ")
                    TextField(
                        "취미를 입력하세요",
                        text: $name
                        )
                }
                
                
            }
            .padding()
            .font(.title2)
            
            Spacer()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingAddSheet = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        isShowingAddSheet = false
                    }
                }
            }
            
            
        }
        
    }
}

struct MemberAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberAddView(memberStore: MemberStore(),
                          isShowingAddSheet: .constant(true), name: "")
        }
    }
}
