//
//  Expenses.swift
//  MyExpenses
//
//  Created by KET on 27/12/2021.
//

import Foundation
class Expenses: ObservableObject {
    @Published var items = [ExpensesItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpensesItem].self, from: savedItem) {
                items = decoded
                return
            }
        }
        
        items = []
    }
}
