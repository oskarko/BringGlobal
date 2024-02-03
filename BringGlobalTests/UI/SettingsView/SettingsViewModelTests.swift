//
//  SettingsViewModelTests.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import BringGlobal

final class SettingsViewModelTests: XCTestCase {

    var viewModel: SettingsViewModel!
    var mockSettingsView: SettingsViewMock!
    var mockLocationManager: LocationManagerMock!
    
    override func setUp() {
        super.setUp()
        mockLocationManager = LocationManagerMock()
        mockSettingsView = SettingsViewMock()
        viewModel = SettingsViewModel(locationManager: mockLocationManager)
        viewModel.view = mockSettingsView
    }
    
    override func tearDown() {
        viewModel = nil
        mockSettingsView = nil
        mockLocationManager = nil
        super.tearDown()
    }
    
    func test_send_withDelete() throws {
        // Given
        mockSettingsView.showConfirmWasCalled = false
        mockLocationManager.removeAllLocationsWasCalled = false
        
        // When
        viewModel.send(.delete)
        
        // Then
        XCTAssertTrue(mockLocationManager.removeAllLocationsWasCalled)
        XCTAssertTrue(mockSettingsView.showConfirmWasCalled)
    }
    
    func test_send_withMEasurements() throws {
        // Given
        mockLocationManager.updateMeasurementWasCalled = false
        
        // When
        viewModel.send(.measurement(1))
        
        // Then
        XCTAssertTrue(mockLocationManager.updateMeasurementWasCalled)
        XCTAssertTrue(mockLocationManager.measurement == "imperial")
    }
}
