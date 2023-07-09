//
//  Member.swift
//  RandomMember
//
//  Created by Chloe Chung on 2023/07/06.
//

import Foundation

struct Member: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: String
    var email: String
}
