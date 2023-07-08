//
//  Sticker.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import Foundation
import SwiftUI

struct Sticker: Identifiable {
    var id: UUID = UUID()
    var memo: String
    var color: Color
    var date: Date
    
    var dateString: String {
        // 날짜 말고
        // 방금, 오늘, 어제, 이번주, 이번달, ....
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd EEEE HH:mm"
        
        return dateFormatter.string(from: date)
    }
}


