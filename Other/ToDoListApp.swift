//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Suad Demiri on 01.04.24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: Team.self)
        }
    }
}
