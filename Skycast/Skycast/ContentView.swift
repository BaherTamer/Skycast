//
//  ContentView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    
    @State private var city = City(name: "Add your City", lat: 0, lon: 0)
    @State private var isShowingCitiesView = false
    
    @ObservedObject private var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationStack {
            TodayForecast(for: city)
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $isShowingCitiesView) {
                    CitiesListView { city in
                        self.city = city
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        cityNameButton
                    }
                }
                .onChange(of: locationManager.userLocation) { newValue in
                    controlCitiesSheet(for: newValue)
                }
                .onAppear {
                    controlCitiesSheet(for: locationManager.userLocation)
                }
        }
    }
    
    private var cityNameButton: some View {
        Button {
            isShowingCitiesView = true
        } label: {
            Text(city.name)
                .font(.title3)
                .fontWeight(.semibold)
                .tint(Color(UIColor.systemBackground))
        }
    }
    
    // MARK: - Functions
    private func controlCitiesSheet(for location: CLLocation?) {
        if location == nil {
            isShowingCitiesView = true
        } else {
            isShowingCitiesView = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
