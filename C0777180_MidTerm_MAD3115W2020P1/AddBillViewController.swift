//
//  AddBillViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-13.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController {

    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var billTypeField: UITextField!
    
    @IBOutlet weak var billAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func createBillPicker(){
        let billPicker = UIPickerView()
        billPicker.delegate = self
        billTypeField.inputView = billPicker
    }

    

}
