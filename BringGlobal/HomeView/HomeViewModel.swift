//  HomeViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum HomeAction {
    case maps
    case settings
}

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?
    
    // MARK: - Helpers
    
    func send(_ action: HomeAction) {
        switch action {
        case .maps: router?.navigateToMaps()
        case .settings: router?.navigateToSettings()
        }
    }
    
    func numberOfRows() -> Int {
        return .zero
    }
    
    func cellForRow(_ indexPath: IndexPath) -> LocationModel? {
        return nil
    }
    
}
