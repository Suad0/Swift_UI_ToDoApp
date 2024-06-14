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
            HeaderView(title: "Register", subtitle: "Suad App", angle: -15, backgroundColor: .orange)
            
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                Button("Register") {
                    viewModel.register()
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}

