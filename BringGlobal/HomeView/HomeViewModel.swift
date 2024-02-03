//  HomeViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum HomeAction {
    case load
    case maps
    case settings
}

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?
    private var locationManager: LocationManagerProtocol!
    private var locations = [LocationModel]()
    
    init(locationManager: LocationManagerProtocol? = LocationManager.shared) {
        self.locationManager = locationManager
    }
    
    // MARK: - Helpers
    
    func send(_ action: HomeAction) {
        switch action {
        case .load: loadLocations()
        case .maps: router?.navigateToMaps()
        case .settings: router?.navigateToSettings()
        }
    }
    
    private func loadLocations() {
        locations = locationManager.getAllLocations()
        view?.reloadData()
    }
    
    func numberOfRows() -> Int {
        return locations.count
    }
    
    func cellForRow(_ indexPath: IndexPath) -> LocationModel? {
        guard indexPath.row < locations.count else { return nil }
        
        return locations[indexPath.row]
    }
    
}
