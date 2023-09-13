//
//  ContentViewModel.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

@MainActor final class ContentViewModel: ObservableObject {
    
    @Published var city: City = City(name: "Add your city", lat: 0, lon: 0)
    
    @Published var isShowingCitiesView = false
    @Published var isShowingSettingsView = false
    
    func fetchCity(locationManager: LocationManager) {
        let cities = LocalDataManager.loadCities()
        
        if !cities.isEmpty {
            self.city = cities.first!
            return
        }

        var coordinate: (lat: Double, lon: Double) = (0, 0)
        
        if let userLocation = locationManager.userLocation {
            coordinate.lat = userLocation.coordinate.latitude
            coordinate.lon = userLocation.coordinate.longitude
            
            self.city = City(name: "Current Location", lat: coordinate.lat, lon: coordinate.lon)
            
            self.isShowingCitiesView = false
            return
        }
        
        if city.lat != 0 && city.lon != 0 && !cities.isEmpty {
            self.isShowingCitiesView = false
            return
        }
        
        self.city = City(name: "Add your city", lat: 0, lon: 0)
        self.isShowingCitiesView = true
    }
    
}
