//
//  WeatherRequestModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

struct WeatherRequestModel: Codable {
    let lat: String
    let lon: String
    let measurement: String
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case measurement
    }
}
