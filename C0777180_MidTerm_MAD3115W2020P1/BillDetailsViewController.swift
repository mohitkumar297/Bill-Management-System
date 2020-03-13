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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(addTapped))
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
            customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)\nTotal Bill : \(am)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 17)
            customerInfo.backgroundColor = UIColor.blue
            customerInfo.textColor = UIColor.green
            
       }
     }
    @objc func addTapped(){
        let choice = customerBill!
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let VC = sb.instantiateViewController(identifier: "addBillCell") as? AddBillViewController {
            self.navigationController?.pushViewController(VC, animated: true)
            VC.selectedCustomer = choice
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
            
            let exists = customerBill?.bills["I"] != nil
            if exists{
                let v = customerBill?.bills["I"]
                let str = v?.billDate.formatDate()
                cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                cell.textLabel?.numberOfLines = 0
        }
            else {
                cell.textLabel?.text = "No bill"
            }
    }
         if indexPath.section == 1{
             let exists = customerBill?.bills["H"] != nil
                       if exists{
                           let v = customerBill?.bills["H"]
                        let str = v?.billDate.formatDate()
                        cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                        cell.textLabel?.numberOfLines = 0
                   }
            else {
                cell.textLabel?.text = "No bill"
            }
        }
        
        if indexPath.section == 2
         {
            let exists = customerBill?.bills["M"] != nil
                if exists{
                    let v = customerBill?.bills["M"]
                 let str = v?.billDate.formatDate()
                 cell.textLabel?.text = "Bill Id : \(v!.billId)\nBill Type : Internet\nBill Date : \(str!)\nBill Amount : \(v!.billAmount)"
                 cell.textLabel?.numberOfLines = 0
            }
            else {
                cell.textLabel?.text = "No bill"
            }
        }
            return cell
    
    }
}
