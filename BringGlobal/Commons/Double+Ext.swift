//
//  Double+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension Double {
    var asDate: Date {
        Date(timeIntervalSince1970: self)
    }
    
    var asDateOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .full
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEEE, dd-MM-YY"
        
        return dateFormatter.string(from: date)
    }
    
    var asTimeOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "h a"
        
        return dateFormatter.string(from: date)
    }
    
    var asDateDayOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.string(from: date)
    }
}
