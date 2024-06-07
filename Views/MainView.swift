//
//  ContentView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn {
            
            TabView {
                
                ToDoListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        
                        
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                        
                        
                    }
                
                CalenderView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                
                
                
            }
            
            
            
            
            
        } else {
            LoginView(viewModel: LoginViewViewModel(mainViewModel: viewModel))
        }
    }
}


#Preview {
    MainView()
}
