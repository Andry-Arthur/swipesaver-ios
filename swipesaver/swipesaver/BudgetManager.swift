//
//  BudgetManager.swift
//  swipesaver
//
//  Created by Andry on 4/24/25.
//

import Foundation

class BudgetManager {
    static let shared = BudgetManager()
    
    var entries: [BudgetEntry] = []
    
    func addEntry(_ entry: BudgetEntry) {
        entries.append(entry)
    }
    
    func getMonthEntries(month: Int, year: Int) -> [BudgetEntry] {
        return entries.filter { entry in
            let components = Calendar.current.dateComponents([.month, .year], from: entry.date)
            return components.month == month && components.year == year
        }
    }
    
    func calculateBalance(for entries: [BudgetEntry]) -> Double {
        var balance = 0.0
        for entry in entries {
            if entry.isIncome {
                balance += entry.amount
            } else {
                balance -= entry.amount
            }
        }
        return balance
    }
}
