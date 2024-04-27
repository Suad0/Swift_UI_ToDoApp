//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var isLoggedIn = false
        
        func userLoggedIn() {
            isLoggedIn = true
        }
}
