//
//  ExpenseItem.swift
//  Animation
//
//  Created by min phone on 17/02/2023.
//

import Foundation

struct ExpenseItem: Identifiable,Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
