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

       }
     
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
        if let id = customerBill?.customerId, let fn = customerBill?.fullName, let em = customerBill?.email, let am = customerBill?.calculatedBill(){
        let formatAmount = "\(am)".formatCurrency()
        customerInfo.text = "  Customer ID          :    \(id)\n  Customer Name  :    \(fn)\n  Customer Email   :    \(em)\n  Total Bill                   :     \(formatAmount)"
        customerInfo.numberOfLines = 0
        customerInfo.font = UIFont.boldSystemFont(ofSize: 20)
        customerInfo.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.2039215686, blue: 0.3843137255, alpha: 1)
        customerInfo.textColor = #colorLiteral(red: 0.9333333333, green: 0.9607843137, blue: 0.8588235294, alpha: 1)
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
            cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Internet\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
                 cell.textLabel?.numberOfLines = 0
        }
        
        if bill.billId.contains("HYD"){
                    let str = bill.billDate.formatDate()
                    let formatBillAmount = "\(bill.billAmount)".formatCurrency()
                    cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Hydro\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
                    cell.textLabel?.numberOfLines = 0
        }
        
        if bill.billId.contains("MOB"){
                let str = bill.billDate.formatDate()
                 let formatBillAmount = "\(bill.billAmount)".formatCurrency()
                 cell.textLabel?.text = "Bill Id                 :   \(bill.billId)\nBill Type           :   Mobile\nBill Date           :   \(str)\nBill Amount     :   \(formatBillAmount)"
                 cell.textLabel?.numberOfLines = 0

            

        }
            return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0){
           cell.backgroundColor = #colorLiteral(red: 0.5137254902, green: 0.5803921569, blue: 0.631372549, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8431372549, blue: 0.8588235294, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }

}
