//
//  CustomerViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-05.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    
    @IBOutlet weak var tblCustomers: UITableView!
   
    lazy var customerNames : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerNames = DataStorage.getInstance().getAllCustomers()
        self.navigationItem.title = "Customer"
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Customers", style: .done, target: nil, action: nil)
        //self.navigationItem.hidesBackButton = true;
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addNewCustomerBackBtn(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "addNewCustomerSegue", sender: nil)
        
    }
    
   
}
extension CustomerViewController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customerNames[indexPath.row]
        cell?.textLabel?.text = customer.fullName
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = customerNames[indexPath.row]
        
        if let VC = storyboard?.instantiateViewController(identifier: "billDetails") as? CustomerViewController{
            VC.customerNames = [select]
            navigationController?.pushViewController(VC, animated: true)
        }
    }
}

