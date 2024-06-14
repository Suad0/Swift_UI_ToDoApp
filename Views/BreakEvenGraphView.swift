//
//  GraphView.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import SwiftUI

struct BreakEvenGraphView: View {
    let costData: CostData
    let maxUnits: Double
    let maxY: Double
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let breakEvenPoint = costData.breakEvenPoint()
            let maxX = maxUnits
            let scaleX = width / maxX
            let scaleY = height / maxY
            
            let fixedCostY = height - CGFloat(costData.fixedCost) * scaleY
            
            Path { path in
                // Fixed cost line
                path.move(to: CGPoint(x: 0, y: fixedCostY))
                path.addLine(to: CGPoint(x: width, y: fixedCostY))
            }
            .stroke(Color.red, lineWidth: 2)
            
            Path { path in
                // Total cost line
                path.move(to: CGPoint(x: 0, y: height))
                path.addLine(to: CGPoint(x: width, y: height - CGFloat(costData.totalCost(for: maxUnits)) * scaleY))
            }
            .stroke(Color.orange, lineWidth: 2)
            
            Path { path in
                // Revenue line
                path.move(to: CGPoint(x: 0, y: height))
                path.addLine(to: CGPoint(x: width, y: height - CGFloat(costData.revenue(for: maxUnits)) * scaleY))
            }
            .stroke(Color.blue, lineWidth: 2)
            
            // Break-even point
            let breakEvenX = CGFloat(breakEvenPoint) * scaleX
            let breakEvenY = height - CGFloat(costData.revenue(for: breakEvenPoint)) * scaleY
            
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .position(x: breakEvenX, y: breakEvenY)
            
            Text("Break-even Point")
                .position(x: breakEvenX + 60, y: breakEvenY - 20)
                .foregroundColor(.black)
                .font(.footnote)
        }
    }
}


/*
 
 #Preview {
 BreakEvenGraphView()
 }
 
 */
 
 
