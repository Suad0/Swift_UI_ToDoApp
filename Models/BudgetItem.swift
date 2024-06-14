//
//  BudgetItem.swift
//  ToDoList
//
//  Created by Suad Demiri on 11.06.24.
//

import Foundation

struct BudgetItem: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
}
