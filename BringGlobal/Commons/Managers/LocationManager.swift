//
//  LocationManager.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    func saveLocation(_ location: LocationModel)
    func removeLocation(_ location: LocationModel)
    func getAllLocations() -> [LocationModel]
}

final class LocationManager: LocationManagerProtocol {
    static let shared = LocationManager()
    
    private init() {}
    
    func saveLocation(_ location: LocationModel) {
        var allLocations = getAllLocations()
        allLocations.append(location)
        
        // To store in UserDefaults
        if let encoded = try? JSONEncoder().encode(allLocations) {
            UserDefaults.standard.set(encoded, forKey: "locations")
        }
    }
    
    func removeLocation(_ location: LocationModel) {
        var allLocations = getAllLocations()
        allLocations = allLocations.filter({
            $0.title != location.title &&
            $0.latitude != location.latitude &&
            $0.longitude != location.longitude
        })
        
        // To store in UserDefaults
        if let encoded = try? JSONEncoder().encode(allLocations) {
            UserDefaults.standard.set(encoded, forKey: "locations")
        }
    }
    
    func existsLocation(_ location: LocationModel) -> Bool {
        let allLocations = getAllLocations()
        let existsLocation = !allLocations.filter({
            $0.title != location.title &&
            $0.latitude != location.latitude &&
            $0.longitude != location.longitude
        }).isEmpty
        
        return existsLocation
    }
    
    func getAllLocations() -> [LocationModel] {
        // Retrieve from UserDefaults
        guard let data = UserDefaults.standard.object(forKey: "locations") as? Data,
           let allLocations = try? JSONDecoder().decode([LocationModel].self, from: data)
        else {
             return []
        }
        return allLocations
    }
}
