//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var age: Int = 0
    @Published var members: Int = 0
    
    init() {}
    
}
