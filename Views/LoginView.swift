//
//  LoginView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct LoginView: View {
    
    
    @StateObject var viewModel: LoginViewViewModel
        
        init(viewModel: LoginViewViewModel = LoginViewViewModel(mainViewModel: MainViewViewModel())) {
            self._viewModel = StateObject(wrappedValue: viewModel)
        }
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "TeamTrackr", subtitle: "Suads App", angle: 30, backgroundColor: Color.brown)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()

                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .disableAutocorrection(true)

                    
                    Button("Login") {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(CGSize(width: 10.0, height: 10.0))
                
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
