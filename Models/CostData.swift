//
//  CostData.swift
//  ToDoList
//
//  Created by Suad Demiri on 13.06.24.
//

import Foundation

struct CostData {
    let fixedCost: Double
    let variableCost: Double
    let pricePerUnit: Double
    
    func totalCost(for units: Double) -> Double {
        return fixedCost + (variableCost * units)
    }
    
    func revenue(for units: Double) -> Double {
        return pricePerUnit * units
    }
    
    func breakEvenPoint() -> Double {
        return fixedCost / (pricePerUnit - variableCost)
    }
}
