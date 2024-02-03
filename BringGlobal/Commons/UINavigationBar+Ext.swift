//
//  UINavigationBar+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setDefaultConfiguration() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithDefaultBackground()

        let compactAppearance = standardAppearance.copy()

        self.standardAppearance = standardAppearance
        self.scrollEdgeAppearance = standardAppearance
        self.compactAppearance = compactAppearance
        self.compactScrollEdgeAppearance = compactAppearance
    }
}
