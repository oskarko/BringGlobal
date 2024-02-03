//
//  City7DaysViewModelTests.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import BringGlobal

final class City7DaysViewModelTests: XCTestCase {

    var viewModel: City7DaysViewModel!
    var mockCity7DaysView: City7DaysViewMock!
    var mockService: WeatherServiceMock!
    var mockLocationManager: LocationManagerMock!
    
    override func setUp() {
        super.setUp()
        let location = LocationModel(title: "mock", latitude: 6.0, longitude: 14.0)
        mockLocationManager = LocationManagerMock()
        mockService = WeatherServiceMock()
        mockCity7DaysView = City7DaysViewMock()
        viewModel = City7DaysViewModel(locationModel: location, service: mockService, locationManager: mockLocationManager)
        viewModel.view = mockCity7DaysView
    }
    
    override func tearDown() {
        viewModel = nil
        mockCity7DaysView = nil
        mockLocationManager = nil
        mockService = nil
        super.tearDown()
    }
    
    func test_updateView_withSuccess() throws {
        // Given
        let expectation = XCTestExpectation(description: #function)
        mockCity7DaysView.showCurrentWeatherWasCalled = false
        
        // When
        viewModel.updateView()
        
        // Hack-ish to test async code
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertTrue(mockCity7DaysView.showCurrentWeatherWasCalled)
    }
    
    func test_getWeatherDailyCount() throws {
        // Given
        
        // When
        let count = viewModel.getWeatherDailyCount()
        
        // Then
        XCTAssertTrue(count == 0)
    }
    
    func test_getWeatherDaily() throws {
        // Given
        
        // When
        let daily = viewModel.getWeatherDaily(index: 0)
        
        // Then
        XCTAssertNil(daily)
    }
    
}
