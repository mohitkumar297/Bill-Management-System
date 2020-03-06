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
            customers.append(try Customer(customerId: "C301", firstName: "Steven", lastName: "Gerrard", email: "sgerrard@gmail.com"))
            customers.append(try Customer(customerId: "C302", firstName: "Sadio", lastName: "Mane", email: "Sadiom@yahoo.com"))
        
    }catch validEmail.invalidEmail(let Problem){
        print("Invalid Email Address : \(Problem)")
    }
    catch {
        print("Unrecognised Error")
    }
}
}
