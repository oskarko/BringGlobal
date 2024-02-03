//  HomeViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadData()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load all saved locations in order to print them in our tableView
        viewModel.send(.load)
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
        title = "Brings"
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Trash action
        let trash = UIContextualAction(style: .destructive,
                                       title: "Trash") { [weak self] (action, view, completionHandler) in
            self?.viewModel.send(.trash(indexPath))
            completionHandler(true)
        }
        trash.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [trash])
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.send(.details(indexPath))
    }
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
