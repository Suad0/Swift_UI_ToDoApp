//
//  ContentView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewViewModel()
        
        var body: some View {
            if viewModel.isLoggedIn {
                ToDoListView()
                    .padding()
            } else {
                LoginView(viewModel: LoginViewViewModel(mainViewModel: viewModel))
            }
        }
}


#Preview {
    MainView()
}
