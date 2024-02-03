//
//  HomeViewModelTests.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import BringGlobal

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockHomeView: HomeViewMock!
    var mockLocationManager: LocationManagerMock!
    
    override func setUp() {
        super.setUp()
        mockLocationManager = LocationManagerMock()
        mockHomeView = HomeViewMock()
        viewModel = HomeViewModel(locationManager: mockLocationManager)
        viewModel.view = mockHomeView
    }
    
    override func tearDown() {
        viewModel = nil
        mockHomeView = nil
        mockLocationManager = nil
        super.tearDown()
    }
    
    func test_send_withLoads() throws {
        // Given
        mockHomeView.reloadDataWasCalled = false
        mockLocationManager.getAllLocationsWasCalled = false
        
        // When
        viewModel.send(.load)
        
        // Then
        XCTAssertTrue(mockLocationManager.getAllLocationsWasCalled)
        XCTAssertTrue(mockHomeView.reloadDataWasCalled)
    }
    // 👆 Should create as many tests as cases have the enum

    func test_cellForRow() throws {
        // Given
        
        // When
        viewModel.send(.load)
        let cellModel = viewModel.cellForRow(IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssert(cellModel?.title == "mockTitle")
        XCTAssert(cellModel?.latitude == 4.0)
        XCTAssert(cellModel?.longitude == 22.0)
    }

    func test_numberOfRows() throws {
        // Given
        // When
        viewModel.send(.load)
        let number = viewModel.numberOfRows()
        
        // Then
        XCTAssert(number == mockLocationManager.locations.count)
    }

}
