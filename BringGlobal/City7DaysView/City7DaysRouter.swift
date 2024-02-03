//  City7DaysRouter.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class City7DaysRouter {
    
    // MARK: - Properties
    
    weak var viewController: City7DaysViewController?

    // MARK: - Helpers
    
    static func getViewController(for locationModel: LocationModel) -> City7DaysViewController {
        let configuration = configureModule(for: locationModel)

        return configuration.vc
    }
    
    private static func configureModule(for locationModel: LocationModel) -> (vc: City7DaysViewController, vm: City7DaysViewModel, rt: City7DaysRouter) {
        let viewController = City7DaysViewController()
        let router = City7DaysRouter()
        let viewModel = City7DaysViewModel(locationModel: locationModel)

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
}
