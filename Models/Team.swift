//
//  Team.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//

import Foundation
import SwiftData


@Model
class Team {
    
    var name: String
    var members: String
    var details: String
    var priority: Int
    var date: Date
    
    init(name: String = "", members: String = "", details: String = "", priority: Int = 1, date: Date = .now) {
        self.name = name
        self.members = members
        self.details = details
        self.priority = priority
        self.date = date
    }
    
}
