//  CityRouter.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class CityRouter {
    
    // MARK: - Properties
    
    weak var viewController: CityViewController?

    // MARK: - Helpers
    
    static func getViewController(for locationModel: LocationModel) -> CityViewController {
        let configuration = configureModule(for: locationModel)

        return configuration.vc
    }
    
    private static func configureModule(for locationModel: LocationModel) -> (vc: CityViewController, vm: CityViewModel, rt: CityRouter) {
        let viewController = CityViewController()
        let router = CityRouter()
        let viewModel = CityViewModel(locationModel: locationModel)

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
    func navigateTo7DaysForecast(for location: LocationModel) {
        let city7DaysView = City7DaysRouter.getViewController(for: location)
        viewController?.navigationController?.pushViewController(city7DaysView, animated: true)
    }
}
