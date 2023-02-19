//
//  ContentView.swift
//  Animation
//
//  Created by min phone on 16/02/2023.
//

import SwiftUI


struct ContentView: View {
   
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                
                // in the foreach we can omit the value id because the struct expense item confirms
                // identifiable protocol 
                ForEach(expenses.items){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("MyExpenses")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Mobile Recharge", type: "Personal", amount: 100)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                            if #available(iOS 15.0, *) {
                                AddItem(expenses: expenses)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                  }
     
        
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
