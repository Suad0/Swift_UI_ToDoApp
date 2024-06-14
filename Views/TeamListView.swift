//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct TeamListView: View {
    
    @StateObject var viewModel = TeamListViewViewModel()
    @State private var showNewItemView = false
    @State private var searchText = ""
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $searchText)
                
                List(filteredItems) { item in
                    NavigationLink(destination: TeamView(item: item)) {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("Age: \(item.age)")
                            Text("Members: \(item.members)")
                        }
                    }
                }
            }
            .navigationTitle("Your Teams")
            .toolbar {
                Button {
                    showNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showNewItemView, content: {
                NewItemView { newItem in
                    viewModel.addItem(newItem)
                }
                
            })
            .presentationDetents([.medium])
            
            
        }
    }
    
    var filteredItems: [ToDoItem] {
        if searchText.isEmpty {
            return viewModel.items
        } else {
            return viewModel.items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

#Preview {
    TeamListView()
}
