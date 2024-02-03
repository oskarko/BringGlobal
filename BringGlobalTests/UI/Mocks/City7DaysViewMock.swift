//
//  City7DaysViewMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class City7DaysViewMock: City7DaysViewControllerProtocol {
    
    var showCurrentWeatherWasCalled = false
    var showErrorWasCalled = false
    
    
    func showCurrentWeather() {
        showCurrentWeatherWasCalled = true
    }
    
    func showError() {
        showErrorWasCalled = true
    }
}
