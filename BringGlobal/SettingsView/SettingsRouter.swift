//  SettingsRouter.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class SettingsRouter {
    
    // MARK: - Properties
    
    weak var viewController: SettingsViewController?

    // MARK: - Helpers
    
    static func getViewController() -> SettingsViewController {
        let configuration = configureModule()

        return configuration.vc
    }
    
    private static func configureModule() -> (vc: SettingsViewController, vm: SettingsViewModel, rt: SettingsRouter) {
        let viewController = SettingsViewController()
        let router = SettingsRouter()
        let viewModel = SettingsViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes
    
}