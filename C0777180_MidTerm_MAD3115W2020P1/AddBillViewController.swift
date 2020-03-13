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
    var selectedCustomer: Customer?
    
    
    let types = ["Mobile","Hydro","Internet"]
    var selectedType : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        createBillPicker()
        createDatePicker()
        createToolBar()
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        if let id = idField.text, let df = dateField.text , let btf = billTypeField.text, let baf = billAmountField.text
                    
                { if id == "" || df == "" || btf == "" || baf == "" {
                    let alertController = UIAlertController(title: "ERROR", message:
                        "Incomplete Form", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }
                else if btf == "Mobile" && !id.hasPrefix("MOB"){
                    let alertController = UIAlertController(title: "ERROR", message:
                        "ID should start with MOB", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }
                    else if btf == "Hydro" && !id.hasPrefix("HYD"){
                        let alertController = UIAlertController(title: "ERROR", message:
                            "ID should start with HYD", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                        self.present(alertController, animated: true, completion: nil)
                    }
                    else if btf == "Internet" && !id.hasPrefix("INT"){
                        let alertController = UIAlertController(title: "ERROR", message:
                            "ID should start with INT", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                        self.present(alertController, animated: true, completion: nil)
                    }
                    else{
                    if id.contains("INT"){
                        selectedCustomer?.customerBills.updateValue(Bill(billId: "\(id)", billDate: df.toDate(), billType: BillType.Internet, billAmount: Double(baf)!), forKey: "\(id)")
                    }
                    else if id.contains("HYD"){
                        selectedCustomer?.customerBills.updateValue(Bill(billId: "\(id)", billDate: df.toDate(), billType: BillType.Hydro, billAmount: Double(baf)!), forKey: "\(id)")
                    }
                    else if id.contains("MOB"){
                     selectedCustomer?.customerBills.updateValue(Bill(billId: "\(id)", billDate: df.toDate(), billType: BillType.Mobile, billAmount: Double(baf)!), forKey: "\(id)")
                 }

    }
    }
         self.navigationController?.popViewController(animated: true)
        
    }
    func createDatePicker(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(AddBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        dateField.inputView = datePicker
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        dateField.text = datePicker.date.formatDate()
    }
    func createBillPicker(){
        let billPicker = UIPickerView()
        billPicker.delegate = self
        billTypeField.inputView = billPicker
        billPicker.backgroundColor = .white
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddBillViewController.dismissKeyboard))
       let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddBillViewController.cancelClick))
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        billTypeField.inputAccessoryView = toolBar
        dateField.inputAccessoryView = toolBar
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @objc func cancelClick(){
        billTypeField.resignFirstResponder()
        dateField.resignFirstResponder()
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
