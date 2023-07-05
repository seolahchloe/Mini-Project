//
//  ArtistStore.swift
//  Artist
//
//  Created by Chloe Chung on 2023/07/05.
//

import Foundation
import Combine

// ObservableObject 프로토콜을 따르는 class는
// Published 프로퍼티 래퍼가 잡힌 내용의 변경사항이 있을때마다
// ObservedObject를 프로퍼티 래퍼로 선언한 누군가에게 알려준다

class ArtistStore: ObservableObject {
    @Published var artists: [Artist]
    
    init() {
        self.artists = [
            Artist(name: "아이유", favoriteSong:"하루 끝", gender: .female),
            Artist(name: "김채원", favoriteSong:"안티티티", gender: .female),
            Artist(name: "Beenzino", favoriteSong: "if I die tomorrow", gender: .male),
            Artist(name: "윤하", favoriteSong: "사건의 지평선", gender: .female),
            Artist(name: "아이묭", favoriteSong: "사랑을 전하고 싶다든가", gender: .female),
            Artist(name: "선우정아", favoriteSong: "도망가자", gender: .female),
            Artist(name: "10cm", favoriteSong: "gradation", gender: .male),
            Artist(name: "Weekend", favoriteSong: "Blind", gender: .male),
            Artist(name: "칼든강도", favoriteSong: "가까운 듯 먼 그대여", gender: .male),
            Artist(name: "가던말던", favoriteSong: "나무", gender: .male),
        ]
    }
    
    func addArtist(name: String, favoriteSong: String, gender: Gender) {
        if name.count > 0 && favoriteSong.count > 0 {
            let artist: Artist = Artist(name: name, favoriteSong: favoriteSong, gender: gender)
            
            print("\(artist)")
            
            artists.append(artist)
        }
    }
    
    func removeArtist(_ artist: Artist) {
        print("\(artist.name)을 삭제해야한데요..ㅠㅠ")
        /*
        var index: Int = 0
        
        for tempArtist in artists {
            if artist.id == tempArtist.id {
                artists.remove(at: index)
                break
            }
            
            index += 1
        }
        */
        
        // 한줄로도 지울 수 있다
        artists.removeAll(where: { $0.id == artist.id })
    }
}
