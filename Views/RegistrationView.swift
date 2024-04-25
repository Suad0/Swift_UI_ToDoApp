//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        
        VStack {
            // Registration Form
            
            HeaderView(title: "register", subtitle: "String", angle: -15, backgroundColor: .orange)
            
            Form{
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
            }
            
            Button {
                // Action
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 8) // Adjust the corner radius
                        .frame(width: 120, height: 40) // Adjust the width and height
                    
                    Text("Register")
                        .foregroundColor(Color.white)
                        .bold()
                }
                
            }

            
            
            
            
        }
        
    }
}

#Preview {
    RegistrationView()
}

