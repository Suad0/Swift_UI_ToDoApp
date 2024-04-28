//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        
        
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To do list ")
            .toolbar{
                Button {
                    // Action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        
        
        
        
        
        
    }
}

#Preview {
    ToDoListView()
}
