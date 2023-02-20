//
//  Expenses.swift
//  Animation
//
//  Created by min phone on 17/02/2023.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded,forKey: "items")
            }
        }
        
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    
    
}
