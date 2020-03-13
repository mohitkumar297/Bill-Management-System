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
        self.navigationItem.title = "Customer"

        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9215686275, alpha: 1)
        navBar?.isTranslucent = true
        
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
//        let customer = customerNames[indexPath.row]
//        cell?.textLabel?.text = customer.fullName
//
       return cell!
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item = customerNames[indexPath.row]
//
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        if let VC = sb.instantiateViewController(identifier: "billDetails") as? BillDetailsViewController {
//            self.navigationController?.pushViewController(VC, animated: true)
//            VC.customerBill = item
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = customerNames[indexPath.row]

        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let VC = sb.instantiateViewController(identifier: "billTable") as? BillDetailsTableViewController {
            self.navigationController?.pushViewController(VC, animated: true)
            VC.customerBill = item
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0){
           cell.backgroundColor = #colorLiteral(red: 0.5137254902, green: 0.5803921569, blue: 0.631372549, alpha: 1)
            
            
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8431372549, blue: 0.8588235294, alpha: 1)
        }
    }
}

