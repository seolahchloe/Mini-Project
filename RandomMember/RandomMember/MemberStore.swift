//
//  MemberStore.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import Foundation
import Combine

// 멤버들을 담을 더 큰 그릇

class MemberStore: ObservableObject {
    
    // @Published - member내용이 변경되면 ObservableObject에 알려줄 것
    @Published var members: [Member] = []
    
    var randomMember: Member {
//        Member(name: "나미리")
        members.randomElement() ?? Member(name: "(없는 멤버)", age: "(나이 없음)", email: "email@email.com")
        
    }
    
    var membersEmpty: Bool {
        members.isEmpty
    }
    
    init() {
//        members = [
//            Member(name: "짱구"),
//            Member(name: "철수"),
//            Member(name: "맹구"),
//            Member(name: "유리"),
//            Member(name: "훈이"),
//            Member(name: "짱아"),
//            Member(name: "이슬이 누나"),
//            Member(name: "수지"),
//            Member(name: "흑곰"),
//            Member(name: "봉미선"),
//            Member(name: "신형만")
//        ]
    }
    
    func addMember(name: String, age: String, email: String) {
        if name.count > 1 {
            let member: Member = Member(name: name, age: age, email: email)
            members.append(member)
//        } else {
//            Alert(title: "이름을 두 글자 이상 입력해주세요.")
        }
    }
}
