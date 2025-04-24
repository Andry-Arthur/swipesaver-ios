//
//  BudgetEntry.swift
//  swipesaver
//
//  Created by Andry on 4/24/25.
//

import Foundation

struct BudgetEntry {
    var id = UUID()
    var name: String
    var amount: Double
    var date: Date
    var category: String
    var isIncome: Bool
    var imageData: Data?
}
