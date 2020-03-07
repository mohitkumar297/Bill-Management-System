//
//  AddNewCustomerViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-06.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {

    @IBOutlet weak var idTxtField: UITextField!
    
    @IBOutlet weak var firstNameTxtField: UITextField!
    
    
    @IBOutlet weak var lastNameTxtField: UITextField!
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "New Customer"
    }
    
    
    @IBAction func saveBarBtn(_ sender: UIBarButtonItem) {
        do{
            if let id = idTxtField.text, let fn = firstNameTxtField.text , let ln = lastNameTxtField.text, let em = emailTxtField.text
             {
                    DataStorage.getInstance().addCustomer(customer: try Customer(customerId: "\(id)", firstName: "\(fn)", lastName: "\(ln)", email: "\(em)"))
             
            
                
        }
    }catch LoginError.emailError{
        print("Invalid Email Address")
    }
    catch {
        print("Unrecognised Error")
    }
    
   }
    
    @IBAction func showBack(_ sender: UIButton) {
        performSegue(withIdentifier: "segueSave", sender: self)
    }
    
}
