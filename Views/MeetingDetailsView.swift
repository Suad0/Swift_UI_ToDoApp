//
//  MeetingDetailsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 11.06.24.
//

import SwiftUI

struct MeetingDetailsView: View {
    @Binding var isPresented: Bool
    @State private var description: String = ""
    @State private var invitees: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Description")) {
                    TextField("Enter meeting description", text: $description)
                }
                
                Section(header: Text("Invitees")) {
                    TextField("Enter invitees (comma separated)", text: $invitees)
                }
            }
            .navigationTitle("Meeting Details")
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                // Handle save action here
                isPresented = false
            })
        }
    }
}

struct MeetingDetailsView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        MeetingDetailsView(isPresented: $isPresented)
    }
}
