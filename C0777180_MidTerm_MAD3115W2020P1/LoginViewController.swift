//
//  ViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-05.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let email = "mohit@gmail.com"
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var switchSave: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        
    }
    
}

