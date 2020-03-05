//
//  Bill.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-05.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import Foundation
enum BillType{
    case Mobile, Internet, Hydro, Insurance
}

class Bill:IDisplay{
    
     var billId: String
     var billDate: Date
     var billType: BillType?
     var billAmount: Double
    
    init(billId: String,billDate: Date,billType: BillType, billAmount: Double) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.billAmount = billAmount
    }
    func display() {
        
        print("         Bill ID : \(billId)")
        let str = billDate.formatDate(date: billDate)
        print("         Bill Date : \(str)")
        print("         Bill Type : \(billType!)")
        let d = "".formatCurrency(billAmount: billAmount)
        print("         Bill Amount : \(d)")
    }
  }
