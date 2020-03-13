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
        
        self.Bills = (customerBill?.getBills())!
        self.navigationItem.title = "Bill Details"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(addTapped))
        self.tblView.reloadData()
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.totalBill{
            let formatAmount = "\(am)".formatCurrency()
            customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)\nTotal Bill : \(formatAmount)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 17)
            customerInfo.backgroundColor = UIColor.blue
            customerInfo.textColor = UIColor.green
            self.tblView.reloadData()
       }
     }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
        let formatAmount = "\(am)".formatCurrency()
        customerInfo.text = "Customer ID : \(id)\nCustomer Name : \(fn)\nCustomer Email : \(em)\nTotal Bill : \(formatAmount)"
        customerInfo.numberOfLines = 0
        customerInfo.font = UIFont.boldSystemFont(ofSize: 17)
        customerInfo.backgroundColor = UIColor.blue
        customerInfo.textColor = UIColor.green
           self.Bills = (customerBill?.getBills())!
           self.tblView.reloadData()
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
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (customerBill?.getBills().count)!
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        if section == 0{
//            label.text = "Internet"
//            label.backgroundColor = UIColor.lightGray
//            label.font = UIFont.boldSystemFont(ofSize: 20)
//        }
//        else if section == 1 {
//            label.text = "Hydro"
//            label.backgroundColor = UIColor.lightGray
//            label.font = UIFont.boldSystemFont(ofSize: 20)
//        }
//        else {
//            label.text = "Mobile"
//            label.backgroundColor = UIColor.lightGray
//            label.font = UIFont.boldSystemFont(ofSize: 20)
//        }
//        return label
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)
        let bill = Bills[indexPath.row]
        
        if bill.billId.contains("INT"){
                let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Internet\nBill Date : \(str)\nBill Amount : \(formatBillAmount)"
                 cell.textLabel?.numberOfLines = 0
        }
        
        if bill.billId.contains("HYD"){
                    let str = bill.billDate.formatDate()
                    let formatBillAmount = "\(bill.billAmount)".formatCurrency()
                    cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Internet\nBill Date : \(str)\nBill Amount : \(formatBillAmount)"
                    cell.textLabel?.numberOfLines = 0


        }
        
        if bill.billId.contains("MOB"){
                let str = bill.billDate.formatDate()
                 let formatBillAmount = "\(bill.billAmount)".formatCurrency()
                 cell.textLabel?.text = "Bill Id : \(bill.billId)\nBill Type : Internet\nBill Date : \(str)\nBill Amount : \(formatBillAmount)"
                 cell.textLabel?.numberOfLines = 0

            

        }
            return cell
}
}
