//
//  Internet.swift
//  C0777180_W2020_MID_TERM_MAD3004
//
//  Created by Mohit Kumar on 2020-02-13.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//
import Foundation

class Internet: Bill {
    var providerName = String()
    var internetUsed: Int=0
    
    
    init(billId: String, billDate: Date, billType: BillType, billAmount: Double,providerName:String,internetUsed:Int) {
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
        
        self.providerName = providerName
        self.internetUsed = internetUsed
        
    }
    
    //    override func display() {
    //        super.display()
    //        print("         Provider Name is : \(providerName)")
    //        print("".gbConsumed(internetUsed: internetUsed))
    //        print("         ***************************************************")
    //    }
    
    
}
