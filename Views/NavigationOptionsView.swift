//
//  NavigationOptionsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import SwiftUI

struct NavigationOptionsView: View {
    @State private var showTaskView = false
    @State private var showBudgetsView = false

    var body: some View {
        VStack {
            Button(action: {
                showTaskView.toggle()
            }) {
                Label("Go to TaskView", systemImage: "list.bullet")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showTaskView) {
                TasksView()
            }

            Button(action: {
                showBudgetsView.toggle()
            }) {
                Label("Go to BudgetsView", systemImage: "chart.pie")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showBudgetsView) {
                BudgetsView()
            }
        }
        .padding()
        .navigationTitle("Navigation Options")
    }
}


#Preview {
    NavigationOptionsView()
}
