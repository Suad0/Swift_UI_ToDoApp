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
                
                TeamListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        
                        
                    }
                
               
                
                
                
                DatePickerView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                        
                        
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
