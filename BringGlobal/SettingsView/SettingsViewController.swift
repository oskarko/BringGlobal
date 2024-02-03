//  SettingsViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {
    func showConfirm()
}

final class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var systemSegmentControl: UISegmentedControl!
    
    var viewModel: SettingsViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        viewModel.send(.measurement(index))
    }
    
    @IBAction func deleteAllBookmarksButtonTapped(_ sender: UIButton) {
        viewModel.send(.delete)
    }
    
    // MARK: - Helpers

    private func configureUI() {
        title = "Settings"
    }
    
}

// MARK: - SettingsViewControllerProtocol

extension SettingsViewController: SettingsViewControllerProtocol {
    func showConfirm() {
        let alert = UIAlertController(title: "Alert",
                                      message: "All locations deleted!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
