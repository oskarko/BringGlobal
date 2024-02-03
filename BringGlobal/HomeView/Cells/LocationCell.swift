//
//  LocationCell.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var latLabel: UILabel!
    @IBOutlet private weak var lngLabel: UILabel!
    
    
    func configure(with locationModel: LocationModel) {
        titleLabel.text = locationModel.title
        latLabel.text = "lat: \(locationModel.latitude)"
        lngLabel.text = "lng: \(locationModel.longitude)"
    }
    
}
