//
//  BillDetailsViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-06.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class BillDetailsViewController: UIViewController {

    @IBOutlet weak var customerInfo: UILabel!
    lazy var Bills : [Bill] = []
    var customerBill : Customer?
    @IBOutlet weak var billInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bill Details"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
       
      //  Bills = DataStorage.getInstance().getBills(customerId: "\(id)" ?? "0"!
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email{
            customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)"
            customerInfo.numberOfLines = 0
          
            if let abc = customerBill?.bills{
//                for(_,v) in abc{
//                    for a in v.billType{
//                        billInfo.text="\(a.)"
//                    }
//                }
                
                for(_,v) in abc{
                    
                    if v.billId.contains("INT"){
//                        if let bid = v.billId, let bname = v.billType, let btype = v.billType, let bdate = v.billDate, let pr = v
                        billInfo.text = "\(v)"
                    }
            }
        
    }
  }
}
}
