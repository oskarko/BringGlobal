//
//  String+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension String {
    var asWeatherIcon: String {
        "https://openweathermap.org/img/wn/\(self)@2x.png"
    }
    
    var isNumber: Bool {
        !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var asUrl: URL? {
        URL(string: self)
    }
    
    var asDouble: Double {
        Double(self) ?? 0
    }
    
    var asInt: Int {
        Int(self) ?? 0
    }
    
    func trim() -> String {
        self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var asImage: UIImage? {
        UIImage(named: self)
    }
}
