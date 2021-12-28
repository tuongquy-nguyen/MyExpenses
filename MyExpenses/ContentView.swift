//
//  ContentView.swift
//  MyExpenses
//
//  Created by KET on 27/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)

                            }
                            Spacer()
                            VStack {
                                Text(item.amount, format: .currency(code: "VND"))
                                    .font(.headline)
                            }
                        }
                    }
                    .onDelete(perform: removeItem)
                }
            }
            .toolbar {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("My Expenses")
            .sheet(isPresented: $showAddView) {
                addNew(expenses: expenses)
            }
        }
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
