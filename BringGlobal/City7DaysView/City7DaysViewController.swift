//  City7DaysViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol City7DaysViewControllerProtocol: AnyObject {
    func showCurrentWeather()
    func showError()
}

class City7DaysViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: City7DaysViewModel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpTableView()
        NKProgress.show(inView: view, color: .clear)
        viewModel.updateView()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        navigationItem.title = "7 Days"
    }
    
    private func setUpTableView() {
        let nib = UINib(nibName: WeatherDayTVC.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WeatherDayTVC.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
}

extension City7DaysViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getWeatherDailyCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDayTVC.className) as! WeatherDayTVC
        cell.data = viewModel.getWeatherDaily(index: indexPath.row)
        return cell
    }
}

// MARK: - City7DaysViewControllerProtocol

extension City7DaysViewController: City7DaysViewControllerProtocol {
    
    func showCurrentWeather() {
        NKProgress.dismiss()
        tableView.reloadData()
    }
    
    func showError() {
        NKProgress.dismiss()
        let alert = UIAlertController(title: "Alert",
                                      message: "Problem Fetching Weather",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
