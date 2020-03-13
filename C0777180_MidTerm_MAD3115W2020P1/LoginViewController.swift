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
    
    let email = String()
    let password = String()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var switchSave: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Logout", style: .done, target: nil, action: nil)
        
        let ud = UserDefaults.standard
        let e = ud.string(forKey: "email")
        let p = ud.string(forKey: "password")
        
        if let em = e {
            emailTextField.text = "\(em)"
        }
        
        if let pa = p {
            passwordTextField.text = "\(pa)"
        }
        
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let access = getPlist(withName: "AccessUsers") else{
            print("no no")
            return
        }
        
        do{
            try login()
            var canEnter = false
            for (k,v) in access{
                if emailTextField.text! == k && passwordTextField.text! == v{
                    canEnter = true
                }
            }
            if canEnter{
                if switchSave.isOn == true {
                    UserDefaults.standard.set(emailTextField.text!, forKey: "email")
                    UserDefaults.standard.set(passwordTextField.text!, forKey: "password")
                }
                else {
                    UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "password")
                    emailTextField.text = ""
                    passwordTextField.text = ""
                }
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
    func getPlist(withName name: String) -> [String: String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: String]
        }
        
        return nil
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

