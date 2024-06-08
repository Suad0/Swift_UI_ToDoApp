//
//  TeamViewOther.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import SwiftUI
import SwiftData

struct TeamViewOther: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Team]()
    @State private var sortOrder = SortDescriptor(\Team.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            TeamListeningView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Your Team")
                .navigationDestination(for: Team.self, destination: EditTeamView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Team.name))
                            
                            Text("Priority")
                                .tag(SortDescriptor(\Team.priority, order: .reverse))
                            
                            Text("Date")
                                .tag(SortDescriptor(\Team.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addDestination() {
        let team = Team()
        modelContext.insert(team)
        path = [team]
    }
}

#Preview {
    TeamViewOther()
}
