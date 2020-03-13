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
    
    let types = ["Mobile","Hydro","Internet"]
    var selectedType : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        createBillPicker()
        
    }
    
    func createBillPicker(){
        let billPicker = UIPickerView()
        billPicker.delegate = self
        billTypeField.inputView = billPicker
    }
}

extension AddBillViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = types[row]
        billTypeField.text = selectedType
    }
    
    
}
