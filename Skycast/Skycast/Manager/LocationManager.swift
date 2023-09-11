//
//  LocationManager.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import CoreLocation
import Foundation

class LocationManager: ObservableObject {
    
    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    @Published var servicesIsDenied: Bool = true
    
    static let shared = LocationManager()
    private init() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        checkLocationAuthorization()
    }
    
    func checkLocationAuthorization() {
        self.servicesIsDenied = false
        
        switch manager.authorizationStatus{
            
        case .notDetermined:
            self.servicesIsDenied = true
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
