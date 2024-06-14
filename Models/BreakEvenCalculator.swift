//
//  BreakEvenCalculator.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import Foundation


struct BreakEvenCalculator {
    let fixedCost: Double
    let variableCost: Double
    let pricePerUnit: Double
    
    func breakEvenPoint() -> Double {
        return fixedCost / (pricePerUnit - variableCost)
    }
}
