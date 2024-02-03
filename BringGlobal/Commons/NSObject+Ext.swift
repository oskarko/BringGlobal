//
//  NSObject+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        String(describing: self.self)
    }
}
