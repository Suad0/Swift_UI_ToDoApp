//
//  TeamView.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import SwiftUI

struct TeamView: View {
    var item: ToDoItem
    @State private var tasks: [Task] = [
        Task(name: "Task 1", startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
        Task(name: "Task 2", startDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!)
    ]
    @State private var showNewTaskView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(item.name)")
                .font(.headline)
            Text("Age: \(item.age)")
            Text("Members: \(item.members)")
            
            GanttChartView(tasks: tasks)
                .padding(.top)
            
            Button(action: {
                showNewTaskView.toggle()
            }) {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top)
        }
        .padding()
        .navigationTitle("Item Details")
        .sheet(isPresented: $showNewTaskView) {
            NewTaskView { newTask in
                tasks.append(newTask)
            }
        }
    }
}

#Preview {
    TeamView(item: ToDoItem(name: "Sample", age: 25, members: 5))
}
