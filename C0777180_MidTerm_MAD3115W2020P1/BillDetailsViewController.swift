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
    lazy var internetArray : [Bill] = []
    lazy var hydroArray : [Bill] = []
    lazy var mobileArray : [Bill] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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
            customerInfo.text = "  Customer ID          :    \(id)\n  Customer Name   :    \(fn)\n  Customer Email    :    \(em)\n  Total Bill                  :     \(formatAmount)"
            customerInfo.numberOfLines = 0
            customerInfo.font = UIFont.boldSystemFont(ofSize: 19)
            customerInfo.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.2039215686, blue: 0.3843137255, alpha: 1)
            customerInfo.textColor = #colorLiteral(red: 0.9333333333, green: 0.9607843137, blue: 0.8588235294, alpha: 1)
        }
        Bills.removeAll()
        internetArray.removeAll()
        mobileArray.removeAll()
        hydroArray.removeAll()
        self.Bills = (customerBill?.getBills())!
        for a in Bills{
                if a.billId.contains("INT"){
                    internetArray.append(a)
                }
                else if a.billId.contains("HYD"){
                    hydroArray.append(a)
                }
                else if a.billId.contains("MOB"){
                    mobileArray.append(a)
                }
            tblView.reloadData()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            
            let label = UILabel()
            if section == 0{
                label.text = "  Internet"
                label.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                label.font = UIFont.boldSystemFont(ofSize: 20)
                label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                label.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else if section == 1 {
                label.text = "  Hydro"
                label.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                label.font = UIFont.boldSystemFont(ofSize: 20)
                label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                label.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                label.text = "  Mobile"
                label.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                label.font = UIFont.boldSystemFont(ofSize: 20)
                label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
            }
            return label
        }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0{

            return internetArray.count
        }
        else if section == 1 {
            return hydroArray.count
            
        }
        else{
            return mobileArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath)

            if indexPath.section == 0 {
            let bill = internetArray[indexPath.row]
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id               :   \(bill.billId)\nBill Type          :   Internet\nBill Date          :   \(str)\nBill Amount     :   \(formatBillAmount)"
            cell.textLabel?.numberOfLines = 0
        }
        
        
            if indexPath.section == 1{
            let bill = hydroArray[indexPath.row]
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id               :   \(bill.billId)\nBill Type          :   Hydro\nBill Date          :   \(str)\nBill Amount     :   \(formatBillAmount)"

            cell.textLabel?.numberOfLines = 0
        }
        
        if indexPath.section == 2{
            let bill = mobileArray[indexPath.row]
            
            let str = bill.billDate.formatDate()
            let formatBillAmount = "\(bill.billAmount)".formatCurrency()
            cell.textLabel?.text = "Bill Id               :   \(bill.billId)\nBill Type          :   Mobile\nBill Date          :   \(str)\nBill Amount     :   \(formatBillAmount)"

            cell.textLabel?.numberOfLines = 0
            
            }
            
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = #colorLiteral(red: 0.9215686275, green: 1, blue: 0.9843137255, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
}
}
