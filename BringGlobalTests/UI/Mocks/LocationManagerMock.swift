//
//  LocationManagerMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class LocationManagerMock: LocationManagerProtocol {
    var saveLocationWasCalled = false
    var removeLocationWasCalled = false
    var getAllLocationsWasCalled = false
    var removeAllLocationsWasCalled = false
    var updateMeasurementWasCalled = false
    var getMeasurementWasCalled = false
    
    var measurement = "metric"
    var locations = [LocationModel(title: "mockTitle", latitude: 4.0, longitude: 22.0)]
    
    func saveLocation(_ location: LocationModel) {
        saveLocationWasCalled = true
    }
    
    func removeLocation(_ location: LocationModel) {
        removeLocationWasCalled = true
    }
    
    func getAllLocations() -> [LocationModel] {
        getAllLocationsWasCalled = true
        
        return locations
    }
    
    func removeAllLocations() {
        removeAllLocationsWasCalled = true
    }
    
    func updateMeasurement(for type: Int) {
        updateMeasurementWasCalled = true
        
        measurement = type == 0 ? "metric" : "imperial"
    }
    
    func getMeasurement() -> String {
        getMeasurementWasCalled = true
        
        return measurement
    }
    
    
}
