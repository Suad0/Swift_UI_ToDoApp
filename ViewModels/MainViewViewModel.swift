//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
       
       // This method should be called when the user successfully logs in
       func userLoggedIn() {
           isLoggedIn = true
       }
       
       // This method should be called when the user logs out
       func userLoggedOut() {
           isLoggedIn = false
       }
    
}
