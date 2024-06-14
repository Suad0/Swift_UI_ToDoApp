//
//  DatePickerView.swift
//  ToDoList
//
//  Created by Suad Demiri on 11.06.24.
//

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()
    @State private var showMeetingDetails = false
    
    var body: some View {
        VStack {
            Text("Select a date")
                .font(.headline)
                .padding()
            
            DatePicker("",
                       selection: $selectedDate,
                       displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            
            Button(action: {
                showMeetingDetails = true
            }) {
                Text("Schedule Meeting")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            
            Text("Selected Date: \(formattedDate(selectedDate))")
                .font(.subheadline)
                .padding()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
        .sheet(isPresented: $showMeetingDetails) {
            MeetingDetailsView(isPresented: $showMeetingDetails)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    DatePickerView()
}
