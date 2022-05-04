//
//  Double.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/10/22.
//

import Foundation


extension Double {
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current       //  <- default value
//        formatter.currencyCode = "usd"    //  <- default - modify to change currency
//        formatter.currencySymbol = "$"    //  <- default - modify to change symbol's currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current       //  <- default value
//        formatter.currencyCode = "usd"    //  <- default - modify to change currency
//        formatter.currencySymbol = "$"    //  <- default - modify to change symbol's currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
}
