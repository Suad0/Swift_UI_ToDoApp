//
//  RegistrationViewViewModel.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import Foundation

class RegistrationViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    let dbConnection = DatabaseConnection() // Instanziere die DatabaseConnection-Klasse
    
    func register() {
       
        
        // Aufrufen der Registrierungsfunktion des DatabaseConnection-Objekts
        dbConnection.register(email: email, password: password, name: name)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
}




