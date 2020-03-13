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
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9215686275, alpha: 1)
        navBar?.isTranslucent = true
    }
    
    
    @IBAction func saveBarBtn(_ sender: UIBarButtonItem) {
        
            if let id = idTxtField.text, let fn = firstNameTxtField.text , let ln = lastNameTxtField.text, let em = emailTxtField.text
                
            { if id == "" || fn == "" || ln == "" {
                let alertController = UIAlertController(title: "ERROR", message:
                    "Incomplete Form", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
            }
            
                else{
                do{
                    DataStorage.getInstance().addCustomer(customer: try Customer(customerId: "\(id)", firstName: "\(fn)", lastName: "\(ln)", email: "\(em)"))
             
            self.navigationController?.popViewController(animated: true)
    }catch LoginError.emailError{
        let alertController = UIAlertController(title: "ERROR", message:
            "Invalid Email", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    catch {
        print("Unrecognised Error")
    }
    
   }
 }
}
}


