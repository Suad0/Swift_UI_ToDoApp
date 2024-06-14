import Foundation

class LoginViewViewModel: ObservableObject {
    
        @Published var email = ""
        @Published var password = ""
        @Published var errorMessage = ""
        @Published var showAlert = false
        
        let dbConnection = DatabaseConnection()
        let mainViewModel: MainViewViewModel // Pass MainViewViewModel
        
        init(mainViewModel: MainViewViewModel) {
            self.mainViewModel = mainViewModel
        }
        
        func login() {
            if dbConnection.login(email: email, password: password) {
                // Successfully logged in
                mainViewModel.userLoggedIn() // Notify MainViewViewModel
            } else {
                // Handle login failure
            }
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
    
    
    

