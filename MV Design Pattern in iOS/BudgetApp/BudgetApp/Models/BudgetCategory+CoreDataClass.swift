//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp
//
//  Created by Bhishak Sanyal on 11/08/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.timestamp = Date()
    }
    
}
