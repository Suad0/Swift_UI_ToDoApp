//
//  EditTeamView.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import SwiftUI
import SwiftData

struct EditTeamView: View {
    @Bindable var team: Team
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $team.name)
            TextField("Details", text: $team.details, axis: .vertical)
            DatePicker("Date", selection: $team.date)
            
            Section("Priority") {
                Picker("Priority", selection: $team.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else { return }
        
        
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Team.self, configurations: config)
        let example = Team(name: "Name", members: "Members", details: "Details", priority: 1, date: Date.now)
        return EditTeamView(team: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
