//  MapsRouter.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class MapsRouter {
    
    // MARK: - Properties
    
    weak var viewController: MapsViewController?

    // MARK: - Helpers
    
    static func getViewController() -> MapsViewController {
        let configuration = configureModule()

        return configuration.vc
    }
    
    private static func configureModule() -> (vc: MapsViewController, vm: MapsViewModel, rt: MapsRouter) {
        let viewController = MapsViewController()
        let router = MapsRouter()
        let viewModel = MapsViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
}