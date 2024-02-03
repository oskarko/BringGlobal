//  City7DaysViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class City7DaysViewModel {
    
    // MARK: - Properties
    
    weak var view: City7DaysViewControllerProtocol?
    var router: City7DaysRouter?
    
    private let locationModel: LocationModel!
    private let service: WeatherServiceProtocol!
    
    private var weather: NKWeatherCodable?
    
    init(locationModel: LocationModel, service: WeatherServiceProtocol? = WeatherService()) {
        self.locationModel = locationModel
        self.service = service
    }
    
    // MARK: - Helpers
    
    func updateView() {
        let model = WeatherRequestModel(lat: "\(locationModel.latitude)", lon: "\(locationModel.longitude)")
        
        service.fetch(WeatherRequest.weather(model)) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case let .success(response):
                    self.weather = response
                    self.view?.showCurrentWeather()
                case .failure(_):
                    self.view?.showError()
                }
            }
        }
    }
    
    func getWeatherDailyCount() -> Int {
        weather?.daily?.count ?? 0
    }
    
    func getWeatherDaily(index: Int) -> NKWeatherDaily? {
        weather?.daily?[index]
    }
}
