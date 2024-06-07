//
//  ToDoListViewModelView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

/// ViewModal for list of iTems view

struct ToDoItem: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var members: Int
}

class ToDoListViewViewModel: ObservableObject {
    @Published var items: [ToDoItem] = []
    
    init() {}
    
    func addItem(_ item: ToDoItem) {
        items.append(item)
    }
}
