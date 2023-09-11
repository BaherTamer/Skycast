//
//  LocationManager.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject {
    
    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    @Published var servicesIsDenied: Bool = true
    
    static let shared = LocationManager ()
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func checkLocationAuthorization() {
        self.servicesIsDenied = false
        
        switch manager.authorizationStatus{
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .denied:
            self.servicesIsDenied = true
            
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            self.userLocation = manager.location
            
        default:
            break
            
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
