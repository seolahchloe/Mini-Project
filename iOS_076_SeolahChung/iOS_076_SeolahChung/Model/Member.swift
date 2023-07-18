//
//  Member.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import Foundation

// MARK: Member Information
/// Basic information about each memebr
/// - name: Member's name
/// - memberImage: Member's profile Image
/// - hobby: Member's hobby or what he/she usually likes to do
struct Member: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var memberImage: String
    var hobby: String
    var age: Int
    
}

