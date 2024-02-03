//  CityViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class CityViewModel {
    
    // MARK: - Properties
    
    weak var view: CityViewControllerProtocol?
    var router: CityRouter?
    
    private let locationModel: LocationModel!
    
    
    init(locationModel: LocationModel) {
        self.locationModel = locationModel
    }
    
    // MARK: - Helpers
    
}
