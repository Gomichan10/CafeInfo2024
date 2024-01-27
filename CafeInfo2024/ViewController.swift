//
//  ViewController.swift
//  CafeInfo2024
//
//  Created by Gomi Kouki on 2024/01/23.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView: GMSMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        requestLocation()
        
    }

    
    func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 35.6812226, longitude: 139.7670594, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let centerButton = UIButton(frame: CGRect(x: 300, y: 600, width: 75, height: 75))
        centerButton.backgroundColor = .white
        centerButton.tintColor = .black
        centerButton.setImage(UIImage(systemName: "figure.stand"), for: .normal)
        centerButton.addTarget(self, action: #selector(centerMapOnUserButtonClicked), for: .touchUpInside)
        centerButton.layer.cornerRadius = 37.0
        self.view.addSubview(centerButton)
    }
    
    @objc func centerMapOnUserButtonClicked() {
        if let location = locationManager.location {
            mapView.animate(toLocation: location.coordinate)
        }
    }

    func requestLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*if let location = locations.first {
            mapView.camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15.0)
        }*/
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

}


