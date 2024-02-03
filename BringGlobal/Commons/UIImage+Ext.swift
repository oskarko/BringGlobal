//
//  UIImage+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UIImage {
    
    var asOriginal: UIImage {
        self.withRenderingMode(.alwaysOriginal)
    }
    
    var asTemplate: UIImage {
        self.withRenderingMode(.alwaysTemplate)
    }
    
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
