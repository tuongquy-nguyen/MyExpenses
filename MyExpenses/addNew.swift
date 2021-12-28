//
//  addNew.swift
//  MyExpenses
//
//  Created by KET on 28/12/2021.
//

import SwiftUI



struct addNew: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var name = ""
    @State private var type = "Nice to have"
    @State private var amount = 0
    let types = ["Must have", "Nice to have", "Wasted"]
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Type your expense:", text: $name)
                
                Text("Enter the type of the expense:")
                Picker("Enter type", selection: $type) {
                    ForEach (types, id: \.self) { selection in
                        Text(selection)
                    }
                }
                .pickerStyle(.segmented)
                TextField("How much did you spend:", value: $amount, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new Expense")
            .toolbar {
                Button("Save") {
                    
                    guard (name != "") else {
                        showingError(title: "Data error", message: "Check your data, It's still empty!")
                        return
                    }
                    
                    guard (amount > 0) else {
                        showingError(title: "Huh? What was that?", message: "You can not spend zero!")
                        return
                    }
                    
                    let item = ExpensesItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            .alert(errorTitle ,isPresented: $showingError) {
                Button("OK") {
                    
                }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func showingError(title: String, message: String) {
        self.errorTitle = title
        self.errorMessage = message
        showingError = true
        
    }
}

struct addNew_Previews: PreviewProvider {
    static var previews: some View {
        addNew(expenses: Expenses())
    }
}
