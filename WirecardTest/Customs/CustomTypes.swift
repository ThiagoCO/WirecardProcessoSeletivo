//
//  CustomType.swift
//  WirecardTest
//
//  Created by Thiago Cavalcante de Oliveira on 28/03/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

extension String {
    
     func formaterDate() -> String{
        
        var dateString = ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        let textFormat = split(separator: "T")
        if let date = dateFormatterGet.date(from: String(textFormat[0])) {
           dateString = dateFormatterPrint.string(from: date)
        }
        return dateString
    }
    
    func formatCustomMoney() -> String {
        
        guard let n = Int(self) else { return self }
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""
        
        switch num {
            
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.truncate(places: 3)
            return "R$ \(sign)\(formatted) B"
            
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.truncate(places: 3)
            return "R$ \(sign)\(formatted) M"
            
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.truncate(places: 3)
            return "R$ \(sign)\(formatted) mil"
            
        case 0...:
            return "R$ \(n)"
            
        default:
            return "R$ \(sign)\(n)"
            
        }
    }
}

extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
