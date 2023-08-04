//
//  ContentView.swift
//  Bookmarks
//
//  Created by Chloe Chung on 2023/08/04.
//

import SwiftUI
import SafariServices

struct Bookmark: Identifiable {
    var id: UUID = UUID()
    var title: String
    var urlString: String
    
    var url: URL {
        URL(string: urlString) ?? URL(string: "https://google.com")!
    }
}

class BookmarkStore: ObservableObject {
    
    @Published var bookmarks: [Bookmark] = []
    
    init() {
        bookmarks = [
            Bookmark(title: "Naver", urlString: "https://naver.com"),
            Bookmark(title: "Daum", urlString: "https://daum.net"),
            Bookmark(title: "Bing", urlString: "https://naver.com"),
            Bookmark(title: "Tech-It", urlString: "https://naver.com"),
            Bookmark(title: "Google", urlString: "https://google.com"),
        ]
    }
    
    func addBookmark(_ bookmark: Bookmark) {
        bookmarks.append(bookmark)
    }
    
    func removeBookmark(at offsets: IndexSet) {
        bookmarks.remove(atOffsets: offsets)
    }
    
}

struct ContentView: View {
    @State var url: URL = URL(string: "https://daum.net")!
    
    @State var isShowingAdding = false
    @State var isShowingWebsite = false
    
    @ObservedObject var bookmarkStore = BookmarkStore()
    
    var body: some View {
        NavigationStack{
            List {
                // .onDelete 수정자를 쓰려면
                // List안에 ForEach로 처리해야 한다
                ForEach(bookmarkStore.bookmarks) { bookmark in
                    Button {
                        url = bookmark.url
                        isShowingWebsite.toggle()
                    } label: {
                        
                        Text("\(bookmark.title)")
                    }
                }
                .onDelete { indexSet in
                    bookmarkStore.removeBookmark(at: indexSet)
                }
            }
            .navigationTitle("Bookmarks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAdding.toggle()
                    } label: {
                        Text("Add")
                    }
                    
                }
            }
        }
        .sheet(isPresented: $isShowingAdding) {
            AddingBookmarkView(bookmarkStore: bookmarkStore, isShowingAdding: $isShowingAdding)
            
        }
        .sheet(isPresented: $isShowingWebsite) {
            SafariView(url: $url)
                .presentationDetents([.medium, .large])
        }
    }
}

    struct AddingBookmarkView: View {
        var bookmarkStore: BookmarkStore
        
        @Binding var isShowingAdding: Bool
        
        @State private var title: String = ""
        @State private var urlString: String = ""
        
        
        var body: some View {
            NavigationStack {
                Form {
                    TextField("Title", text: $title)
                    TextField("URL", text: $urlString)
                        .keyboardType(.URL)
                }
                .navigationTitle("Add new bookmark")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isShowingAdding.toggle()
                        } label: {
                            Text("Cancel")
                        }
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            let bookmark = Bookmark(title: title, urlString: urlString)
                            bookmarkStore.addBookmark(bookmark)
                            isShowingAdding.toggle()
                        } label: {
                            Text("Submit")
                        }
                        
                    }
                }
            }
            
        }
    }
    
    struct SafariView: UIViewControllerRepresentable {
        
        @Binding var url: URL
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
