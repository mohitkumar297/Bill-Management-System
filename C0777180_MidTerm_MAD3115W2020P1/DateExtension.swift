//
//  DateExtension.swift
//  C0777180_MidTerm_MAD3115W2020P1
//
//  Created by Mohit Kumar on 2020-03-05.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import Foundation
extension Date {
    
    func formatDate(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM, yyyy"
        return dateFormatter.string(from: date)
    }
}
