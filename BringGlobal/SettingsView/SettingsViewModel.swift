//  SettingsViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum SettingsAction {
    case delete
    case measurement(Int)
}

class SettingsViewModel {
    
    // MARK: - Properties
    
    weak var view: SettingsViewControllerProtocol?
    var router: SettingsRouter?
    
    private var locationManager: LocationManagerProtocol!
    
    init(locationManager: LocationManagerProtocol? = LocationManager.shared) {
        self.locationManager = locationManager
    }
    
    // MARK: - Helpers
    
    func send(_ action: SettingsAction) {
        switch action {
        case .delete: deleteLocations()
        case let .measurement(int): updateMeasurement(for: int)
        }
    }
    
    private func deleteLocations() {
        locationManager.removeAllLocations()
        view?.showConfirm()
    }
    
    private func updateMeasurement(for type: Int) {
        locationManager.updateMeasurement(for: type)
    }
}
