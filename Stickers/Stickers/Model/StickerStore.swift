//
//  StickerStore.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import Foundation
import SwiftUI

class StickerStore: ObservableObject {
    @Published var stickers: [Sticker] = []
    
    // 테스트를 위해 미리 자료 심기
    init() {
        stickers = [
            Sticker(memo: "배고파", color: .blue, date: Date()),
            Sticker(memo: "갓튀긴후라이드 먹고 싶다", color: .purple, date: Date()),
            Sticker(memo: "하지만 다이어트 해야쥐,,,", color: .green, date: Date()),
        ]
    }
    
    func fetchStickers() {
        if let data = UserDefaults.object(forKey: "Stickers") as? Data {
            do {
                let decoder = JSONDecoder()
                stickers = try decoder.decode([Sticker], self from: data)
            } catch {
                print("UserDefault로 부터 데이터 가져오기 실패")
            }
        }
    }
    
    
    
    func addSticker(memo: String, color: Color) {
        let sticker = Sticker(memo: memo, color: color, date: Date())
        sticker.color = color
        stickers.insert(sticker, at: 0)
        
        // JSON으로 배열 등등의 복잡 데이터를 단일한 데이터로 만들어준다
        // 앞으로도 이런거 있으면 이 코드 복붙하자!
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(stickers)
            
            // 지금은 UserDefaults에 저장하지만,
            // 나중엔 이 부분이 외부의 클라우드 등등에 접속하는 코드로
            // 다양하게 바뀔 수 있다.
            UserDefaults.standard.set(data, forKey: "Stickers")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
    }
    
    func removeSticker(_ sticker: Sticker) {
        var index: Int = 0
        
        for tempSticker in stickers {
            if tempSticker.id == sticker.id {
                stickers.remove(at: index)
                break
            }
            
            index += 1
        }
    }
}
