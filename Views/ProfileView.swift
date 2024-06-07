//
//  ProfileView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModal = ProfileViewViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
        
    }
}

#Preview {
    ProfileView()
}
