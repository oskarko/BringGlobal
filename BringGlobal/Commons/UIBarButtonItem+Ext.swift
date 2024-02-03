//
//  UIBarButtonItem+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    static func settingsButton(_ target: Any, _ action: Selector) -> UIBarButtonItem {
        UIBarButtonItem(image: UIImage(systemName: "gear"),
                        style: .done,
                        target: target,
                        action: action)
    }
    
    static func mapButton(_ target: Any, _ action: Selector) -> UIBarButtonItem {
        UIBarButtonItem(image: UIImage(systemName: "map"),
                        style: .done,
                        target: target,
                        action: action)
    }
    
    static func backButton(_ target: Any, _ action: Selector) -> UIBarButtonItem {
        UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward")?.resized(to: CGSize(width: 12, height: 14)),
            style: .done,
            target: target,
            action: action
        )
    }
}
