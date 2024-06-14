//
//  BreakEvenView.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import SwiftUI

struct BreakEvenView: View {
    
    @State private var fixedCost: Double = 100000
    @State private var variableCost: Double = 5
    @State private var pricePerUnit: Double = 15
    @State private var maxUnits: Double = 20000
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Break-Even Point Calculator")
                        .font(.largeTitle)
                        .padding()
                    
                    BreakEvenGraphView(
                        costData: CostData(
                            fixedCost: fixedCost,
                            variableCost: variableCost,
                            pricePerUnit: pricePerUnit
                        ),
                        maxUnits: maxUnits,
                        maxY: 200000
                    )
                    .frame(height: 400)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                    
                    VStack {
                        Text("Costs")
                            .font(.headline)
                            .padding(.top)
                        
                        HStack {
                            Text("Fixed Cost")
                            Spacer()
                            TextField("Enter fixed cost", value: $fixedCost, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Variable Cost per Unit")
                            Spacer()
                            TextField("Enter variable cost", value: $variableCost, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Price per Unit")
                            Spacer()
                            TextField("Enter price per unit", value: $pricePerUnit, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Max Units")
                            Spacer()
                            TextField("Enter max units", value: $maxUnits, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                }
                .padding()
            }
        }
    }
}





#Preview {
    BreakEvenView()
}
