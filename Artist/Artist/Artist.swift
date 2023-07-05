//
//  Artist.swift
//  Artist
//
//  Created by Chloe Chung on 2023/07/05.
//

import Foundation

enum Gender {
    case female
    case male
}

struct Artist: Identifiable {
    var id: UUID = UUID()
    var name: String
    var favoriteSong: String
    var gender: Gender
    
    var genderString: String {
        switch gender {
        case .female:
            return "여성"
        case .male:
            return "남성"
        }
    }
}

var artists: [Artist] = [
    Artist(name: "아이유", favoriteSong:"하루 끝", gender: .female),
    Artist(name: "김채원", favoriteSong:"안티티티", gender: .female),
]
