//
//  LocationManager.swift
//  NearMe
//
//  Created by Ayodeji Ayakola  on 19/05/2021.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        DispatchQueue.main.async {
            self.location = location
        }
    }
    
    func startUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdates() {
        locationManager.startUpdatingLocation()
    }
}
