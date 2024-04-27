import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    let dbConnection = DatabaseConnection()// Instanziere die DatabaseConnection-Klasse
    

    
    
    func login() {
        
        // Aufrufen der Login-Funktion des DatabaseConnection-Objekts
        if dbConnection.login(email: email, password: password) {
            // Erfolgreich eingeloggt
        } else {
            // Fehler beim Einloggen
        }
    }
    
    
    /*
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Bitte alles ausfüllen"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "E-Mail ist nicht valide"
            return false
        }
        
        return true
    }
     
     */
    
    
    
}
