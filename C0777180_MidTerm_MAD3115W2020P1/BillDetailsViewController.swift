//
//  BillDetailsViewController.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-06.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class BillDetailsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
 
    @IBOutlet weak var customerInfo: UILabel!
    lazy var Bills : [Bill] = []
    var customerBill : Customer?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bill Details"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
       
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email{
            customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)"
            customerInfo.numberOfLines = 0
          
//            if let abc = customerBill?.bills{
//                for(_,v) in abc{
//                    if v.billId.contains("INT"){
//                    billInfo.text = "Bill Id : \(v.billId)\nBill Amount : \(v.billAmount)"
//                }
//             }
//          }
       }
     }
}

extension BillDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0{
            label.text = "Internet"
            label.backgroundColor = UIColor.lightGray
        }
        else if section == 1 {
            label.text = "Hydro"
            label.backgroundColor = UIColor.lightGray
        }
        else {
            label.text = "Mobile"
            label.backgroundColor = UIColor.lightGray
        }
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        //cell.textLabel?.text = "\(name!.billAmount)\(name!.billId)"
        //let name = customerBill?.bills
        
        if indexPath.section == 0{
            var check = false
            for (_,v) in customerBill!.bills{
                if v.billId.contains("INT"){
                    check = true
                    cell.textLabel?.text = "\(v.billId)\(v.billDate)"
            }
//                if check == true{
//                    cell.textLabel?.text = "\(v.billId)\(v.billDate)"
//                }
                else{
                    cell.textLabel?.text = "no bill"
                }
        }
    }
         if indexPath.section == 1{
            for (k,v) in customerBill!.bills{
                if k.starts(with: "HYD"){
                cell.textLabel?.text = "\(v.billId)\(v.billDate)"
                }
                else {
                    cell.textLabel?.text = "No bill "
                }
            }
        }
        if indexPath.section == 2
         {for (k,v) in customerBill!.bills{
            if k.contains("M"){
            cell.textLabel?.text = "\(v.billId)\(v.billDate)"
            }
            else {
                cell.textLabel?.text = "No bill "
            }
            }
            
        }
            return cell
    
    }
}
