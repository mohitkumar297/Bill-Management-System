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
    lazy var customers:[Customer] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCustomers()
        // Do any additional setup after loading the view.
    }
    
    func loadCustomers(){
        customers.append(C1)
        
        
    }
}
    
extension CustomerViewController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customers[indexPath.row]
        cell?.textLabel?.text = customer.firstName
        
        return cell!
        
    }
            
    }
    
    

