//
//  ContentView.swift
//  Artist
//
//  Created by Chloe Chung on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var artistStore: ArtistStore = ArtistStore()
    
    @State var name: String = ""
    @State var favoriteSong: String = ""
    @State var isFemale: Bool = true
    
    var gender: Gender {
        return isFemale ? .female : .male
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(artistStore.artists) { artist in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(artist.name)")
                                .font(.title.bold())
                            Text("\(artist.favoriteSong)")
                            Text("\(artist.genderString)")
                        }
                        Spacer()
                        Button {
                            artistStore.removeArtist(artist)
                        } label: {
                            Text("삭제")
                        }

                    }
                }
                
                VStack {
                    TextField("이름", text: $name)
                    TextField("대표곡", text: $favoriteSong)
                    Toggle(isOn: $isFemale) {
                        Text("여성 아티스트인가?")
                    }
                    
                    Button {
                        artistStore.addArtist(name: name, favoriteSong: favoriteSong, gender: gender)
                        resetFields()
                    } label: {
                        Text("아티스트 추가")
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Artists")
        }
    }
    
    func resetFields() {
        name = ""
        favoriteSong = ""
        isFemale = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
