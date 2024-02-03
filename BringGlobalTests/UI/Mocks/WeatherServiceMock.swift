//
//  WeatherServiceMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class WeatherServiceMock: WeatherServiceProtocol {
    func fetch(_ request: BringGlobal.WeatherRequest, completionHandler: @escaping (ResultResponse<NKWeatherCodable>) -> Void) {
        let weather = NKWeatherCodable(lat: 44.0,
                                       lon: -21.0,
                                       timezone: "mock timezone",
                                       timezoneOffset: 90.0,
                                       current: nil,
                                       minutely: [],
                                       hourly: [],
                                       daily: [])
        completionHandler(.success(weather))
    }
    
}
