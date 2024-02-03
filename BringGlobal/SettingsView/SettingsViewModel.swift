//  SettingsViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation
import UIKit

enum SettingsAction {
    case delete
    case measurement(Int)
    case officialDoc
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
        case .officialDoc: openOfficialDocumentationWebPage()
        }
    }
    
    private func deleteLocations() {
        locationManager.removeAllLocations()
        view?.showConfirm()
    }
    
    private func updateMeasurement(for type: Int) {
        locationManager.updateMeasurement(for: type)
    }
    
    private func openOfficialDocumentationWebPage() {
        guard let url = URL(string: MAIN_URL) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
             UIApplication.shared.open(url)
        }
    }
}
