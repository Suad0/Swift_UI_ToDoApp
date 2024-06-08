//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    var onAdd: (Task) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Name", text: $name)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                }
                
                Button("Add") {
                    let newTask = Task(name: name, startDate: startDate, endDate: endDate)
                    onAdd(newTask)
                    dismiss()
                }
            }
            .navigationBarTitle("Add New Task", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}

#Preview {
    NewTaskView(onAdd: { _ in })
}
