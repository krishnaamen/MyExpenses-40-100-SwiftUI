//
//  Expenses.swift
//  Animation
//
//  Created by min phone on 17/02/2023.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
