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
    
    func loadCustomers(){
        do{
            
            let C1 = try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com")
            let C2 = try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com")
            let C3 = try Customer(customerId: "C303", firstName: "Jordan", lastName: "Henderson", email: "jorhen@gmail.IO")
            customers.append(C1)
            customers.append(C2)
            customers.append(C3)
            
            
            let h1 = DateComponents(calendar: calendar, year: 2020, month: 01, day: 10)
            let hd1 = calendar.date(from: h1)
            let H1 = Hydro(billId: "HYD001", billDate: hd1!, billType: BillType.Hydro, billAmount: 280.90, agencyName: "Saint John Energy", unitsConsumed: 350)
            C1.bills.updateValue(H1, forKey: "H")
            
            let m1 = DateComponents(calendar: calendar, year: 2019, month: 12, day: 21)
            let md1 = calendar.date(from: m1)
                let M1 = try Mobile(billId: "MOB101", billDate: md1!, billType: BillType.Mobile, billAmount: 100.53, modelName: "Apple X", mobileNumber: "9865473127", internetUsed: 14, minuteUsed: 351, planName: "15 GB Mega Deal")
            bills.updateValue(M1, forKey: "MOB101")
            C1.bills.updateValue(M1, forKey: "M")
            
            let i1 = DateComponents(calendar: calendar, year: 2019, month: 10, day: 26)
            let id1 = calendar.date(from: i1)
            let I1 = Internet(billId: "INT001",billDate: id1!, billType: BillType.Internet, billAmount: 55.9, providerName: "Rogers", internetUsed: 154)
            bills.updateValue(I1, forKey: "INT001")
            C2.bills.updateValue(I1, forKey: "I")
            
            let m2 = DateComponents(calendar: calendar, year: 2020, month: 01, day: 11)
            let md2 = calendar.date(from: m2)
            let M2 =  try Mobile(billId: "MOB102", billDate: md2!, billType: BillType.Mobile, billAmount: 70.90, modelName: "Samsung S10", mobileNumber: "8990899079", internetUsed: 12, minuteUsed: 120,planName: "Big Gig Unlimited + Talk 10 GB")
            bills.updateValue(M2, forKey: "MOB102")
            C2.bills.updateValue(M2, forKey: "M")
            
            let h2 = DateComponents(calendar: calendar, year: 2019, month: 05, day: 10)
            let hd2 = calendar.date(from: h2)
            let H2 = Hydro(billId: "HYD002", billDate: hd2!, billType: BillType.Hydro, billAmount: 400.25, agencyName: "Thunder Bay Hydro", unitsConsumed: 486)
            bills.updateValue(H2, forKey: "HYD002")
            C2.bills.updateValue(H2, forKey: "H")
            
            let h3 = DateComponents(calendar: calendar, year: 2020, month: 02, day: 05)
            let hd3 = calendar.date(from: h3)
            let H3 = Hydro(billId: "HYD003", billDate: hd3!, billType: BillType.Hydro, billAmount: 150.68, agencyName: "Alectra Utilities", unitsConsumed: 225)
            bills.updateValue(H3, forKey: "HYD003")
            C3.bills.updateValue(H3, forKey: "H")
        }catch LoginError.emailError{
         print("Invalid Email Address")
    
        }
         catch {
          print("Unrecognised Error")
    }
 }
    let calendar = Calendar.current
}
