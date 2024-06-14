//
//  Tasks.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import SwiftUI

struct TasksView: View {
    
    
    @State private var tasks: [Task] = []
    @State private var showNewTaskView = false
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            GanttChartView(tasks: tasks)
                .padding(.top)
            
           
           
            
            Button(action: {
                showNewTaskView.toggle()
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding(.bottom)
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
    TasksView()
}
