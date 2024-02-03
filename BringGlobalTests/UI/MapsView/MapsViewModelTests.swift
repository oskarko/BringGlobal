//
//  MapsViewModelTests.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import BringGlobal

final class MapsViewModelTests: XCTestCase {

    var viewModel: MapsViewModel!
    var mockMapsView: MapsViewMock!
    var mockLocationManager: LocationManagerMock!
    
    override func setUp() {
        super.setUp()
        mockLocationManager = LocationManagerMock()
        mockMapsView = MapsViewMock()
        viewModel = MapsViewModel(locationManager: mockLocationManager)
        viewModel.view = mockMapsView
    }
    
    override func tearDown() {
        viewModel = nil
        mockMapsView = nil
        mockLocationManager = nil
        super.tearDown()
    }
    
    func test_didTap() throws {
        // Given
        mockMapsView.showConfirmWasCalled = false
        mockMapsView.removeAllWasCalled = false
        mockLocationManager.saveLocationWasCalled = false
        
        // When
        viewModel.didTap(for: nil)
        
        // Then
        XCTAssertTrue(mockLocationManager.saveLocationWasCalled)
        XCTAssertTrue(mockMapsView.showConfirmWasCalled)
        XCTAssertTrue(mockMapsView.removeAllWasCalled)
    }
}
