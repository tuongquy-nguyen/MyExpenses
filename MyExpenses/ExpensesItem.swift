//
//  ExpensesItem.swift
//  MyExpenses
//
//  Created by KET on 27/12/2021.
//

import Foundation

struct ExpensesItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
