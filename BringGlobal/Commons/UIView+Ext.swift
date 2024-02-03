//
//  UIView+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setConstraints(to child:UIView) -> Void {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: self.topAnchor),
            child.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func circle(_ radius: Int = 0) {
        if (radius == 0) {
            layer.cornerRadius = self.frame.size.height/2
        } else {
            layer.cornerRadius = CGFloat(radius)
        }
        layer.masksToBounds = true
    }
    
    func border(_ width: CGFloat = 0, color: UIColor = .white) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
