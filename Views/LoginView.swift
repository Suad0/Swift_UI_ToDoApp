//
//  LoginView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModal = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack {
                // Header
                HeaderView(title: "TodoList", subtitle: "A deppate Liste", angle: 30, backgroundColor: Color.brown)

                
                
               
                // Login Form
                Form {
                    
                   
                    
                    TextField("Email Address", text: $viewModal.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModal.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", background: .blue){
                        
                        viewModal.login()
                        
                    }
                    .padding()

                }
                .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
                
                
                
                // Create Account
                VStack {
                    Text("Neu hier")
                    NavigationLink("Create Account", destination: RegistrationView())
                    
                }
                .padding(.bottom, 50)
                
                
                
                Spacer()
            }
            
        }
        
     
    }
}

#Preview {
    LoginView()
}
