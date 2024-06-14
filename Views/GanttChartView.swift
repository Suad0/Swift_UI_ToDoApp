//
//  GanttChartView.swift
//  ToDoList
//
//  Created by Suad Demiri on 08.06.24.
//



import SwiftUI

struct GanttChartView: View {
    var tasks: [Task]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Date Labels
            if let firstTask = tasks.first, let lastTask = tasks.last {
                let totalDuration = Calendar.current.numberOfDaysBetween(firstTask.startDate, and: lastTask.endDate)
                let dateRange = stride(from: firstTask.startDate, through: lastTask.endDate, by: 24*60*60)
                
                HStack {
                    ForEach(Array(dateRange), id: \.self) { date in
                        Text(shortDate(date))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.caption)
                    }
                }
                .padding(.horizontal)
            }
            
            // Task Bars
            ForEach(tasks) { task in
                HStack {
                    Text(task.name)
                        .frame(width: 100, alignment: .leading)
                    
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let daysTotal = Calendar.current.numberOfDaysBetween(task.startDate, and: task.endDate)
                        let totalDuration = Calendar.current.numberOfDaysBetween(tasks.first?.startDate ?? Date(), and: tasks.last?.endDate ?? Date())
                        
                        let barWidth = width * CGFloat(daysTotal) / CGFloat(totalDuration)
                        let offsetX = CGFloat(Calendar.current.numberOfDaysBetween(tasks.first?.startDate ?? Date(), and: task.startDate)) * (width / CGFloat(totalDuration))
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: barWidth, height: 20)
                            .cornerRadius(5)
                            .offset(x: offsetX)
                            .overlay(
                                Text("\(daysTotal) days")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .padding(2),
                                alignment: .center
                            )
                    }
                }
                .padding(.vertical, 5) // Add spacing between tasks
                .frame(height: 30)
            }
        }
        .padding()
    }
    
    private func shortDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let components = dateComponents([.day], from: fromDate, to: toDate)
        return components.day ?? 0
    }
}



#Preview {
    GanttChartView(tasks: [
        Task(name: "Task 1", startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
        Task(name: "Task 2", startDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!)
    ])
}
