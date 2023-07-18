//
//  MemberStore.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import Foundation
import SwiftUI

class MemberStore: ObservableObject {
    @Published var member: [Member] = []
    
    // ISSUE: Text
    init() {
        member = [
            Member(name: "신짱구", memberImage: "zzanggu", hobby: "예쁜 누나 따라다니기", age: 5),
            Member(name: "김철수", memberImage: "chulsoo", hobby: "모에삐 덕질", age: 5),
            Member(name: "맹구", memberImage: "maenggu", hobby: "돌 모으기", age: 5)
        ]
    }
    
    // MARK: 멤버 불러오기 함수
    /// Function for fetching member
    func fetchMember() {
        
    }
    
    
    // MARK: 멤버 저장 함수
    /// Function for save added member
    func saveMember() {
        
    }
    
    //    func addMember{ }
    
    func updateMember(_ member: Member) {
        
    }
    
}

