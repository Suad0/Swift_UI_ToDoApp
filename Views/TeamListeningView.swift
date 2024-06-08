//
//  TeamListeningView.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import SwiftUI
import SwiftData

struct TeamListeningView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Team.priority, order: .reverse), SortDescriptor(\Team.name)]) var teams: [Team]
    
    var body: some View {
        List {
            ForEach(teams) { team in
                NavigationLink(value: team) {
                    VStack(alignment: .leading) {
                        Text(team.name)
                            .font(.headline)
                        
                        
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Team>, searchString: String) {
        _teams = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let team = teams[index]
            modelContext.delete(team)
        }
    }
}

#Preview {
    TeamListeningView(sort: SortDescriptor(\Team.name), searchString: "")
}
