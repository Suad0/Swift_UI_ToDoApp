//
//  BudgetsView.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import SwiftUI

struct BudgetsView: View {
    
    @State private var budgetItems: [BudgetItem] = []
    @State private var showNewBudgetView = false
    
    
    
    var body: some View {
        Button(action: {
            showNewBudgetView.toggle()
        }) {
            HStack {
                Image(systemName: "plus")
                Text("Add Budget Item")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(8)
        }
        
        .padding(.bottom)
        .sheet(isPresented: $showNewBudgetView) {
            NewBudgetItemView { newBudgetItem in
                budgetItems.append(newBudgetItem)
            }
        }
        
        Spacer()
        
        if !budgetItems.isEmpty {
            PieChartView(budgetItems: budgetItems)
                .frame(height: 300)
                .padding(.top)
        }
        
        
        
    }
    
    
}

struct PieSliceView: View {
    var pieSliceData: PieSliceData
    
    var midRadians: Double {
        return Double.pi * (pieSliceData.startAngle + pieSliceData.endAngle) / 360
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let height = width
            let centerX = width * 0.5
            let centerY = height * 0.5
            let radius = width * 0.5
            let startX = centerX + radius * CGFloat(cos(midRadians))
            let startY = centerY + radius * CGFloat(sin(midRadians))
            
            Path { path in
                path.move(to: CGPoint(x: centerX, y: centerY))
                path.addLine(to: CGPoint(x: startX, y: startY))
                path.addArc(center: CGPoint(x: centerX, y: centerY),
                            radius: radius,
                            startAngle: Angle(degrees: pieSliceData.startAngle),
                            endAngle: Angle(degrees: pieSliceData.endAngle),
                            clockwise: false)
                path.closeSubpath()
            }
            .fill(pieSliceData.color)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct PieChartView: View {
    var budgetItems: [BudgetItem]
    
    var slices: [PieSliceData] {
        let total = budgetItems.reduce(0) { $0 + $1.amount }
        var startAngle: Double = 0
        return budgetItems.map { item in
            let endAngle = startAngle + 360 * (item.amount / total)
            let slice = PieSliceData(startAngle: startAngle, endAngle: endAngle, color: Color.random)
            startAngle = endAngle
            return slice
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(slices.indices, id: \.self) { i in
                PieSliceView(pieSliceData: slices[i])
            }
        }
    }
}

struct PieSliceData {
    var startAngle: Double
    var endAngle: Double
    var color: Color
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct NewBudgetItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var category: String = ""
    @State private var amount: String = ""
    var onSave: (BudgetItem) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Category", text: $category)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("New Budget Item", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if let amount = Double(amount), !category.isEmpty {
                    let newBudgetItem = BudgetItem(category: category, amount: amount)
                    onSave(newBudgetItem)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}


#Preview {
    BudgetsView()
}
