//  CityViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol CityViewControllerProtocol: AnyObject {
    func showCurrentWeather()
    func showError()
}

class CityViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humedityLabel: UILabel!
    @IBOutlet weak var rainyLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    var viewModel: CityViewModel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        showView(false)
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: WeatherTodayCVC.className, bundle: .main),
                                forCellWithReuseIdentifier: WeatherTodayCVC.className)
    }
    
    private func showView(_ value:Bool) {
        view.subviews.forEach { v in
            if v.tag == 1991 {
                v.isHidden = !value
            }
        }
    }
    
    // MARK: - Selectors
    
    @IBAction func show7DaysWeatherButtonTapped(_ sender: UIButton) {
        viewModel.show7DaysWeatherButtonTapped()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        title = "City Weather"
        locationLabel.text = viewModel.getLocation()
        viewModel.updateView()
        showView(false)
    }
    
}

// MARK: - UICollectionViewDelegate && UICollectionViewDataSource

extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getWeatherHoursCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherTodayCVC.className,
                                                      for: indexPath) as! WeatherTodayCVC
        cell.data = viewModel.getWeatherHours(index: indexPath.item)
        return cell
    }
}

// MARK: - CityViewControllerProtocol

extension CityViewController: CityViewControllerProtocol {
    func showCurrentWeather() {
        NKProgress.dismiss()
        showView(true)
        let weather = viewModel.getWeather()
        imgWeather.setImage(from: weather?.current?.weather?.first?.icon?.asWeatherIcon ?? "")
        temperatureLabel.text = "\(Int(weather?.current?.temp ?? 0))"
        humedityLabel.text = "Humidity: \(Int(weather?.current?.humidity ?? 0))%"
        rainyLabel.text = "Rain Chance: \(Int(weather?.current?.rain?.the1H ?? 0))%"
        windyLabel.text = "Wind Speed: \(Int(weather?.current?.windSpeed ?? 0))"
        weatherTypeLabel.text = weather?.current?.weather?.first?.main ?? "N/A"
        dateLabel.text = weather?.current?.dt?.asDateOnly
        collectionView.reloadData()
    }
    
    func showError() {
        NKProgress.dismiss()
        let alert = UIAlertController(title: "Alert",
                                      message: "Problem Fetching Current Weather",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
        showView(false)
    }
}
