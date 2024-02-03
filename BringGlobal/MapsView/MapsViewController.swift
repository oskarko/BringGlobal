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
    func removeAllAnnotations()
    func showConfirm()
}

class MapsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var mapView: MKMapView!
    
    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "search"
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftViewMode = .always
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return searchTextField
    }()
    
    var viewModel: MapsViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Helpers

    private func configureUI() {
        mapView.register(CustomAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: CustomAnnotationView.identifier)
        mapView.delegate = self

        view.addSubview(searchTextField)
        
        // add constraints to search textfield
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        searchTextField.returnKeyType = .go
        searchTextField.delegate = self
    }
    
    private func searchLocations(for searchBarText: String) {
        // remove previous annotations
        mapView.removeAnnotations(mapView.annotations)
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let response = response, error == nil else {
                return
            }
            
            if let mapItem = response.mapItems.first {
                let annotation = MKPointAnnotation()
                annotation.coordinate = mapItem.placemark.coordinate
                annotation.title = mapItem.name
                self?.mapView.addAnnotation(annotation)
                
                let camera = MKMapCamera(lookingAtCenter: mapItem.placemark.coordinate, fromDistance: 2000000, pitch: 0, heading: 0)
                self?.mapView.setCamera(camera, animated: true)
            }
        }
    }
    
}

// MARK: - MKMapViewDelegate

extension MapsViewController: MKMapViewDelegate {

    /// show custom annotation view

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        if annotation is MKClusterAnnotation { return nil }

        let customAnnotationViewIdentifier = "MyAnnotation"

        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: customAnnotationViewIdentifier)
        if pin == nil {
            pin = CustomAnnotationView(annotation: annotation, reuseIdentifier: customAnnotationViewIdentifier)
        } else {
            pin?.annotation = annotation
        }
        return pin
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("mapView(_:annotationView:calloutAccessoryControlTapped)")
    }
}

// MARK: - CustomCalloutViewDelegate

extension MapsViewController: CustomCalloutViewDelegate {
    func mapView(_ mapView: MKMapView, didTapBookmarkButton button: UIButton, for annotation: MKAnnotation) {
        viewModel.didTap(for: annotation)
    }
}

// MARK: - UITextFieldDelegate

extension MapsViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text ?? ""
        
        if !text.isEmpty {
            textField.resignFirstResponder()
            // search for locations
            searchLocations(for: text)
        }
        
        return true
    }
}

// MARK: - MapsViewControllerProtocol

extension MapsViewController: MapsViewControllerProtocol {
    func removeAllAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    func showConfirm() {
        let alert = UIAlertController(title: "Alert",
                                      message: "Bookmark successfully added!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
