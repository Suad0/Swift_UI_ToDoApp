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
            ForEach(tasks) { task in
                HStack {
                    Text(task.name)
                        .frame(width: 100, alignment: .leading)
                    
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let daysTotal = Calendar.current.numberOfDaysBetween(task.startDate, and: task.endDate)
                        let totalDuration = Calendar.current.numberOfDaysBetween(tasks.first?.startDate ?? Date(), and: tasks.last?.endDate ?? Date())
                        
                        let barWidth = width * CGFloat(daysTotal) / CGFloat(totalDuration)
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: barWidth, height: 20)
                            .offset(x: CGFloat(Calendar.current.numberOfDaysBetween(tasks.first?.startDate ?? Date(), and: task.startDate)) * (width / CGFloat(totalDuration)))
                    }
                }
            }
        }
        .padding()
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


#Preview {
    GanttChartView(tasks: [
        Task(name: "Task 1", startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
        Task(name: "Task 2", startDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!)
    ])
}
