//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

struct ToDoItem: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var members: Int
}
