//
//  StickerColourSelectView.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import SwiftUI

struct StickerColourSelectView: View {
    @Binding var selectedColor: Color
    
    let color: Color
    
    var body: some View {
        Button {
            // Button의 Action이 길어질듯 하면
            // 따로 method를 만들어 호출하는 편이 좋다
            selectColor()
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .foregroundColor(color)
                    .shadow(radius: 6)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func selectColor() {
        selectedColor = color
        print("\(color) / \(selectedColor)")
    }
}


struct StickerColourSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StickerColourSelectView(selectedColor: .constant(.cyan), color: .cyan)
    }
}
