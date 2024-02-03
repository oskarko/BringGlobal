//
//  CityViewModelTests.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import BringGlobal

final class CityViewModelTests: XCTestCase {

    var viewModel: CityViewModel!
    var mockCityView: CityViewMock!
    var mockRouter: CityRouterMock!
    var mockService: WeatherServiceMock!
    var mockLocationManager: LocationManagerMock!
    
    override func setUp() {
        super.setUp()
        let location = LocationModel(title: "mock", latitude: 6.0, longitude: 14.0)
        mockLocationManager = LocationManagerMock()
        mockService = WeatherServiceMock()
        mockCityView = CityViewMock()
        mockRouter = CityRouterMock()
        viewModel = CityViewModel(locationModel: location, service: mockService, locationManager: mockLocationManager)
        viewModel.view = mockCityView
        viewModel.router = mockRouter
    }
    
    override func tearDown() {
        viewModel = nil
        mockCityView = nil
        mockRouter = nil
        mockLocationManager = nil
        mockService = nil
        super.tearDown()
    }
    
    func test_show7DaysWeatherButtonTapped() throws {
        // Given
        mockRouter.navigateTo7DaysForecastWasCalled = false
        
        // When
        viewModel.show7DaysWeatherButtonTapped()
        
        // Then
        XCTAssertTrue(mockRouter.navigateTo7DaysForecastWasCalled)

    }
    
    func test_updateView_withSuccess() throws {
        // Given
        let expectation = XCTestExpectation(description: #function)
        mockCityView.showCurrentWeatherWasCalled = false
        
        // When
        viewModel.updateView()
        
        // Hack-ish to test async code
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertTrue(mockCityView.showCurrentWeatherWasCalled)
    }
    
    func test_getLocation() throws {
        // Given
        mockRouter.navigateTo7DaysForecastWasCalled = false
        
        // When
        let title = viewModel.getLocation()
        
        // Then
        XCTAssertTrue(title == "mock")
    }
    
    func test_getWeather() throws {
        // Given
        
        // When
        let weather = viewModel.getWeather()
        
        // Then
        XCTAssertNil(weather)
    }
    
    func test_getWeatherHoursCount() throws {
        // Given
        
        // When
        let count = viewModel.getWeatherHoursCount()
        
        // Then
        XCTAssertTrue(count == 0)
    }
    
    func test_getWeatherHours() throws {
        // Given
        
        // When
        let hours = viewModel.getWeatherHours(index: 0)
        
        // Then
        XCTAssertNil(hours)
    }
    
    func test_getSpeed() throws {
        // Given
        
        // When
        let speed = viewModel.getSpeed()
        
        // Then
        XCTAssertTrue(speed == "m/s")
    }
    
    func test_getTemp() throws {
        // Given
        
        // When
        let temp = viewModel.getTemp()
        
        // Then
        XCTAssertTrue(temp == "°C")
    }
}
