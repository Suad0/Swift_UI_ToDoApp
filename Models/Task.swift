//
//  Task.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var startDate: Date
    var endDate: Date
}
