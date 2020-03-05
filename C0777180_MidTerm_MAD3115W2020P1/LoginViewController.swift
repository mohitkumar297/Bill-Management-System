//
//  ViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-05.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

enum LoginError: Error{
case emailError, passwordError, incomplete
}

class LoginViewController: UIViewController {
    
    let email = "mohit@gmail.com"
    let password = "mohit123"
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var switchSave: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        
        do{
            try login()
            if emailTextField.text == email && passwordTextField.text == password{
                performSegue(withIdentifier: "segue", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "ERROR", message:
                    "Access Denied", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
            }
            
        }catch LoginError.incomplete{
            let alertController = UIAlertController(title: "ERROR", message:
                "Incomplete Form", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
        catch  LoginError.emailError{
            let alertController = UIAlertController(title: "ERROR", message:
                "Invalid Email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }catch LoginError.passwordError {
            let alertController = UIAlertController(title: "ERROR", message:
                "Invalid Password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
        catch {
            print("Unrecognized error")
        }
    }
    
    func login() throws{
        let email = emailTextField.text!
        let pass = passwordTextField.text!

        if email.isEmpty || pass.isEmpty {
            throw LoginError.incomplete
        }
        if !email.isValidEmail{
            throw LoginError.emailError
        }
        if pass.count < 8 {
            throw LoginError.passwordError
        }

    }
    
}

