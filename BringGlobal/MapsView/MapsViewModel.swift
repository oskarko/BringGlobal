//  MapsViewModel.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation
import MapKit

class MapsViewModel {
    
    // MARK: - Properties
    
    weak var view: MapsViewControllerProtocol?
    var router: MapsRouter?
    private var locationManager: LocationManagerProtocol!
    
    init(locationManager: LocationManagerProtocol? = LocationManager.shared) {
        self.locationManager = locationManager
    }
    
    // MARK: - Helpers
    
    func didTap(for annotation: MKAnnotation) {
        let locationModel = LocationModel(title: (annotation.title ?? "") ?? "",
                                          latitude: annotation.coordinate.latitude,
                                          longitude: annotation.coordinate.longitude)
        locationManager.saveLocation(locationModel)
        view?.removeAllAnnotations()
        view?.showConfirm()
    }
}
