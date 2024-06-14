//
//  NewItemView.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI

struct NewItemView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModal = NewTeamViewViewModel()
    var onAdd: (ToDoItem) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text("New Team")
                    .font(.system(size: 32))
                    .bold()
                
                Form {
                    Section(header: Text("Details")) {
                        TextField("Name", text: $viewModal.name)
                        TextField("Age", value: $viewModal.age, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        TextField("Members", value: $viewModal.members, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    
                    Button("Add") {
                        let newItem = ToDoItem(name: viewModal.name, age: viewModal.age, members: viewModal.members)
                        onAdd(newItem)
                        dismiss()
                    }
                }
            }
            .navigationBarTitle("Create Team", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}

#Preview {
    NewItemView(onAdd: { _ in })
}
