//
//  DataStorage.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-06.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import Foundation

class DataStorage {
    static private let instance = DataStorage()
    private lazy var customers : [Customer] = []
    private lazy var bills = Dictionary<String, Bill>()
    private init(){
        
    }
    static func getInstance()->DataStorage{
        return instance
    }
    
    func addCustomer(customer: Customer){
        self.customers.append(customer)
    }
    func getAllCustomers()->[Customer]{
        return self.customers
    }
//    func getBills(customerId: String)->[Bill]?{
//        return self.bills[customerId]
//    }
    
    
    func loadCustomers(){
        do{
//            customers.append(try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com"))
//            customers.append(try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com"))
//            customers.append(try Customer(customerId: "C303", firstName: "Jordan", lastName: "Henderson", email: "jorhen@gmail.IO"))
            let C1 = try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com")
            let C2 = try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com")
            let C3 = try Customer(customerId: "C303", firstName: "Jordan", lastName: "Henderson", email: "jorhen@gmail.IO")
            customers.append(C1)
            customers.append(C2)
            customers.append(C3)
            
            let i1 = DateComponents(calendar: calendar, year: 2019, month: 10, day: 26)
            let id1 = calendar.date(from: i1)
            let I1 = Internet(billId: "INT001",billDate: id1!, billType: BillType.Internet, billAmount: 55.9, providerName: "Rogers", internetUsed: 154)
            bills.updateValue(I1, forKey: "INT001")
            C1.bills=["b1": I1]
            let h1 = DateComponents(calendar: calendar, year: 2020, month: 01, day: 10)
            let hd1 = calendar.date(from: h1)
            var H1 = Hydro(billId: "HYD001", billDate: hd1!, billType: BillType.Hydro, billAmount: 280.90, agencyName: "Saint John Energy", unitsConsumed: 350)
            
        }catch LoginError.emailError{
         print("Invalid Email Address")
    
        }
         catch {
          print("Unrecognised Error")
    }
 }
    let calendar = Calendar.current
//    let i1 = DateComponents(calendar: calendar, year: 2019, month: 10, day: 26)
//    let id1 = calendar.date(from: i1)
//    func loadBills(){
//        let i1 = DateComponents(calendar: calendar, year: 2019, month: 10, day: 26)
//        let id1 = calendar.date(from: i1)
//        bills.updateValue(Internet(billId: <#T##String#>, billDate: <#T##Date#>, billType: <#T##BillType#>, billAmount: <#T##Double#>, providerName: <#T##String#>, internetUsed: <#T##Int#>), forKey: <#T##String#>)
//    }
}
