//  HomeViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {

}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        configureTableView()
        configureUI()
    }
    

    // MARK: - Selectors
    
    @objc private func didTapMaps() {
        viewModel.send(.maps)
    }
    
    @objc private func didTapSettings() {
        viewModel.send(.settings)
    }

    
    // MARK: - Helpers
    
    private func configureNavigationController() {
        navigationController?.navigationBar.setDefaultConfiguration()
        
        navigationItem.leftBarButtonItems = [
            .mapButton(self, #selector(didTapMaps))
        ]
        navigationItem.rightBarButtonItems = [
            .settingsButton(self, #selector(didTapSettings))
        ]

    }
    
    private func configureTableView() {
        tableView.register(LocationCell.nib, forCellReuseIdentifier: LocationCell.identifier)
    }

    private func configureUI() {

    }
    
}

// MARK: - UITableViewDelegate && UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier, for: indexPath) as? LocationCell,
            let locationModel = viewModel.cellForRow(indexPath) {
            
            cell.configure(with: locationModel)
            
            return cell
        }

        return UITableViewCell()
    }
    

}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {

}
