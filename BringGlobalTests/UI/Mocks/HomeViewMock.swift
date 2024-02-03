//
//  HomeViewMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class HomeViewMock: HomeViewControllerProtocol {
    var reloadDataWasCalled = false
    
    
    func reloadData() {
        reloadDataWasCalled = true
    }
}
