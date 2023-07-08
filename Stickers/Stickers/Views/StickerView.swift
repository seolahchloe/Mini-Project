//
//  StickerView.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import SwiftUI

struct StickerView: View {
    var stickerStore: StickerStore
    var sticker: Sticker
    
    var body: some View {
        //        VStack {
        HStack {
            VStack(alignment: .leading) {
                Text("\(sticker.memo)")
                    .font(.title)
                    .padding()
                
                Text("\(sticker.dateString)")
                    .font(.footnote)
                    .padding()
                
            }
            Spacer()
        }
        .background(sticker.color)
        .shadow(radius: 6)
        .padding()
        .contextMenu { // 꾹 눌렀을 때 버튼 생성
            ShareLink(item: sticker.memo)
            Button {
                print("Remove")
                stickerStore.removeSticker(sticker)
            } label: {
                Image(systemName: "trash.slash")
                Text("Remove")
            }

        }
        .onAppear {
            stickerStore.fetchStickers()
        }
    }
    
}
//}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView(stickerStore: StickerStore(), sticker: Sticker(memo: "오늘은 뭐먹지", color: .red, date: Date()))
    }
}
