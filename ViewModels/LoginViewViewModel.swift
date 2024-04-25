import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
    }
    
    private func validate()-> Bool{
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage == "Bitte alles ausüllen"
            return false
            
        }
        
        guard email.contains("@") && email.contains(".")else {
            errorMessage = "email nicht valide"
            return false
        }
        
        return true
    }
    
    
    
}
