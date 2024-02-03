//
//  MapsViewMock.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import BringGlobal

final class MapsViewMock: MapsViewControllerProtocol {
    
    var removeAllWasCalled = false
    var showConfirmWasCalled = false
    
    
    func removeAllAnnotations() {
        removeAllWasCalled = true
    }
    
    func showConfirm() {
        showConfirmWasCalled = true
    }
}
