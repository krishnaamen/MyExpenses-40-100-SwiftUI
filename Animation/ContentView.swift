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
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount,format:.currency(code: "DKK"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("MyExpenses")
            .toolbar {
                Button {
                   showingAddExpense = true
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
