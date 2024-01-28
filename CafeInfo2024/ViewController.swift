//
//  ViewController.swift
//  CafeInfo2024
//
//  Created by Gomi Kouki on 2024/01/23.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController, CLLocationManagerDelegate,GMSMapViewDelegate{
    
    var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var isTrackingUserLocation: Bool = true
    var tapCheck: Bool = true
    let centerButton = UIButton(frame: CGRect(x: 300, y: 600, width: 60, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestLocation()
        setupMap()
        centerMapOnUserButtonClicked()
        
    }

    
    func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 35.6812226, longitude: 139.7670594, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view = mapView
        
        centerButton.backgroundColor = .white
        centerButton.tintColor = .black
        centerButton.setImage(UIImage(systemName: "figure.stand"), for: .normal)
        centerButton.addTarget(self, action: #selector(centerMapOnUserButtonClicked), for: .touchUpInside)
        centerButton.layer.cornerRadius = 30.0
        self.view.addSubview(centerButton)
    }
    
    @objc func centerMapOnUserButtonClicked() {
        if tapCheck == true {
        if let location = locationManager.location {
            mapView.animate(toLocation: location.coordinate)
            tapCheck = false
            centerButton.tintColor = .white
            centerButton.backgroundColor = .black
            print(tapCheck)
            return
            }
        }
        else if tapCheck == false{
            tapCheck = true
            centerButton.tintColor = .black
            centerButton.backgroundColor = .white
            print(tapCheck)
            return
        }
        print(isTrackingUserLocation)
    }

    func requestLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if tapCheck == false {
            if let location = locations.first{
                let updatedLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                mapView.animate(toLocation: updatedLocation)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
}


