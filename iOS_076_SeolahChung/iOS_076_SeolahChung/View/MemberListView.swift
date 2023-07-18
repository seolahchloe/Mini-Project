//
//  MemberListView.swift
//  iOS_076_SeolahChung
//
//  Created by Chloe Chung on 2023/07/17.
//

import SwiftUI

struct MemberListView: View {
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    @StateObject var memberStore: MemberStore = MemberStore()
    @State var member: Member = Member(name: "나미리", memberImage: "image", hobby: "취미", age: 5)
    
    @State var isShowingAddSheet: Bool = false
    @State var isShowingEditSheet: Bool = false
    
    // MARK: PickerView 변수
    @State var enableSheet = false
    @State var selectedObject = "이름순"
    @State var selectedSegment = "ActionSheet"
    
    
    
    
    var body: some View {
        VStack {
            List(memberStore.member) { member in
                Button {
                    self.member = member
                    isShowingEditSheet = true
                } label: {
                    MemberView(memberStore: memberStore, member: member)
                }

            }
        }
        .listStyle(.plain)
        .navigationTitle("떡잎마을")
        .toolbar {
            
            // MARK: 줄세우기 버튼
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingAddSheet = true
                } label: {
                    Label("줄세우기", systemImage: "arrow.up.arrow.down.circle.fill")
                }

            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingAddSheet = true
                } label: {
                    Label("추가하기", systemImage: "person.crop.circle.badge.plus")
                }

            }
        }
        .sheet(isPresented: $isShowingAddSheet) {
            MemberAddView(memberStore: memberStore,
                          isShowingAddSheet: $isShowingAddSheet, name: "")
        }
        .refreshable {
            memberStore.fetchMember()
        }
        .onAppear {
            memberStore.fetchMember()
        }
        
    }
        
}

struct MemberListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberListView(memberStore: MemberStore(),
                           member: Member(name: "짱구",
                                          memberImage: "zzanggu",
                                          hobby: "예쁜 누나 따라다니기", age: 5))
        }
    }
}
