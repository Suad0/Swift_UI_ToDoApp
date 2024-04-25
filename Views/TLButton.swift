//
//  TLButton.swift
//  ToDoList
//
//  Created by Suad Demiri on 25.04.24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    
    var body: some View {
        Button {
            // Action
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text("Login")
                    .foregroundColor(Color.white)
                    .bold()
            }
            
        }    }
}

#Preview {
    TLButton(title: "Value", background: .orange){
        // Action 
    }
}
