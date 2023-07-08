//
//  StickerAddView.swift
//  Stickers
//
//  Created by Chloe Chung on 2023/07/07.
//

import SwiftUI

struct StickerAddView: View {
    
    @Binding var isShowingSheet: Bool
    var stickerStore: StickerStore
    
    @State var selectedColor: Color = .cyan
    @State var memo: String = ""
    
    let colors: [Color] = [.cyan, .purple, .yellow, .brown, .black]
    
    var body: some View {
        // sheet로 올라온 View에는 보통
        // 독립적인 NavigationStack을 두는 경우가 흔하다
        // 그래야 타이틀도 보이고 툴바 버튼들도 보인다
        NavigationStack {
            // Form은 List와 다르게
            // 나타나는 항목들이 ㅁ모두 제각각 다른 형태의 것일 때 유용하다
            // but, 지금은 리스트로 만들기
            VStack(alignment: .leading) {
                
                Text("Select a colour")
                    .font(.title)
                    
                HStack {
                    ForEach(colors, id: \.self) { color in
                        StickerColourSelectView(selectedColor: $selectedColor, color: color)
                    }
                }
                
                
                Divider()
                    .padding()
                
                Text("Write a memo")
                    .font(.title)
                // axis라는 옵션을 정해주면 위아래로 길어지는 메모장 가능
                TextField("Memo", text: $memo, axis: .vertical)
                    .font(.title)
                
                
                Spacer()
            }
            .padding()
            .listStyle(.plain)
            .navigationTitle("New Sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingSheet = false
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        stickerStore.addSticker(memo: memo,
                                                color: selectedColor)
                        isShowingSheet = false
                    }
                }
                
            }
            
        }
        
    }
}



struct StickerAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
            // 프리뷰에서 바인딩된 내용을 강제로 만들어 전달하려면
            // .constant를 사용해야 한다.
            StickerAddView(isShowingSheet: .constant(true), stickerStore: StickerStore())
        }
    }
}
