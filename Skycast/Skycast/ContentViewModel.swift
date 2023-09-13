//
//  ContentViewModel.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

@MainActor final class ContentViewModel: ObservableObject {
    
    // MARK: City Variables
    var cityName: String = ""
    @Published var city: City = .tempCity {
        didSet {
            self.updateCityName()
        }
    }
    
    // MARK: Sheets Variables
    @Published var isShowingCitiesView = false
    @Published var isShowingSettingsView = false
    
    // MARK: Network Alert Variables
    @Published var isShowingNetworkAlert = false
    let networkAlertTitle = "Network error"
    let networkAlertMessage = "Looks like we’re having some trouble connecting to our servers. No worries, let’s check your internet connection and try again"
    
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
            
            self.city = City(name: "Current Location", localNames: [
                "ar": "الموقع الحالي",
                "en": "Current Location"
            ], lat: coordinate.lat, lon: coordinate.lon, country: nil, state: nil)
            
            self.isShowingCitiesView = false
            return
        }
        
        if city.lat != 0 && city.lon != 0 && !cities.isEmpty {
            self.isShowingCitiesView = false
            return
        }
        
        self.city = .tempCity
        self.isShowingCitiesView = true
    }
    
    private func updateCityName() {
        let language = SkycastLocal.language
        self.cityName = self.city.localNames?[language] ?? ""
    }
}
