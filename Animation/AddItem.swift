//
//  AddItem.swift
//  Animation
//
//  Created by min phone on 17/02/2023.
//

import SwiftUI

struct AddItem: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    
    
    
    let types = ["Business","Personal"]
    var body: some View {
        NavigationView{
            Form{
                TextField("Name",text: $name)
                Picker("Type",selection: $type){
                    ForEach(types,id:\.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value:$amount, format: .currency(code: "DKK"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
        }
        
        
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem(expenses: Expenses())
    }
}
