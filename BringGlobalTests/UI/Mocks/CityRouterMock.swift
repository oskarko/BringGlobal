//
//  CityRouterMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class CityRouterMock: CityRouterProtocol {
    var navigateTo7DaysForecastWasCalled = false
    var locationModel: LocationModel?
    
    func navigateTo7DaysForecast(for location: LocationModel) {
        navigateTo7DaysForecastWasCalled = true
        locationModel = location
    }
    
}
