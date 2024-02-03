//
//  APIPath.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

enum APIPath {
    case weather
    
    var rawValue: String {
        switch self {
        case .weather: return "/data/2.5/onecall"
        }
    }
}
