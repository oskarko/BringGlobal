//  MapsViewController.swift
//  BringGlobal
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit
import MapKit

protocol MapsViewControllerProtocol: AnyObject {

}

class MapsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var mapView: MKMapView!
    
    var viewModel: MapsViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers

    private func configureUI() {
        mapView.showsUserLocation = true

    }
    
}

// MARK: - MapsViewControllerProtocol

extension MapsViewController: MapsViewControllerProtocol {

}
