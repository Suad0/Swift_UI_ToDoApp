//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI


struct ToDoListView: View {
    
    @StateObject var viewModal = ToDoListViewViewModel()
    @State private var showNewItemView = false
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModal.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text("Age: \(item.age)")
                        Text("Members: \(item.members)")
                    }
                }
            }
            .navigationTitle("To do list")
            .toolbar {
                Button {
                    showNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showNewItemView) {
                NewItemView { newItem in
                    viewModal.addItem(newItem)
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
