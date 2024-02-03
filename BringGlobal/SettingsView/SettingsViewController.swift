//  SettingsViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {

}

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: SettingsViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers

    private func configureUI() {
        title = "Settings"
    }
    
}

// MARK: - SettingsViewControllerProtocol

extension SettingsViewController: SettingsViewControllerProtocol {

}
