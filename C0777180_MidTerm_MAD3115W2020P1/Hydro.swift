//
//  Hydro.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-12.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//


import Foundation

class Hydro: Bill {
    
    var agencyName: String?
    var unitsConsumed: Int = 0
    

    
    init(billId: String, billDate: Date, billType: BillType, billAmount: Double, agencyName: String,unitsConsumed: Int) {
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
        
        self.agencyName = agencyName
        self.unitsConsumed = unitsConsumed
        
    }
    
   override func display() {
    super.display()
    print("         Agency Name : \(agencyName!)")
    print("" .formatUnit(unitsConsumed: unitsConsumed))
    print("         ***************************************************")
    }
}

