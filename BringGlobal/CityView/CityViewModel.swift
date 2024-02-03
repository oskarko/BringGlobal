//  CityViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class CityViewModel {
    
    // MARK: - Properties
    
    weak var view: CityViewControllerProtocol?
    var router: CityRouter?
    
    private let locationModel: LocationModel!
    private let service: WeatherServiceProtocol!
    
    private var weather: NKWeatherCodable?
    
    init(locationModel: LocationModel, service: WeatherServiceProtocol? = WeatherService()) {
        self.locationModel = locationModel
        self.service = service
    }
    
    // MARK: - Helpers
    
    func show7DaysWeatherButtonTapped() {
        router?.navigateTo7DaysForecast(for: locationModel)
    }
    
    func updateView() {
        let model = WeatherRequestModel(lat: "\(locationModel.latitude)", lon: "\(locationModel.longitude)")
        
        service.fetch(WeatherRequest.weather(model)) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self.weather = response
                    self.view?.showCurrentWeather()
                case let .failure(error):
                    print(error.message ?? "--")
                    self.view?.showError()
                }
            }
        }
    }
    
    func getLocation() -> String {
        return locationModel.title
    }
    
    func getWeather() -> NKWeatherCodable? {
        return weather
    }
    
    func getWeatherHoursCount() -> Int {
        weather?.hourly?.count ?? 0
    }
    
    func getWeatherHours(index: Int) -> NKWeatherCurrent? {
        weather?.hourly?[index]
    }
}
