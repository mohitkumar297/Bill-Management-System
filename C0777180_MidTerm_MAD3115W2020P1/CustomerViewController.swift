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
        
       //customerNames = DataStorage.getInstance().getAllCustomers()
        self.navigationItem.title = "Customer"
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Customers", style: .done, target: nil, action: nil)
        //self.navigationItem.setHidesBackButton(true, animated: false)
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        
    }
    @objc func addTapped(){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        customerNames = DataStorage.getInstance().getAllCustomers()
        tblCustomers.reloadData()
        
    }
    
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
       let alert = UIAlertController(title: "Logged Out", message: "Session Over", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
               (_)in
            self.navigationController?.popViewController(animated: true)
           })
        
            alert.addAction(OKAction)
           self.present(alert, animated: true, completion: nil)
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
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let VC = sb.instantiateViewController(identifier: "billDetails") as? BillDetailsViewController {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}

