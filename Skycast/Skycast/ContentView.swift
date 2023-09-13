//
//  ContentView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @ObservedObject private var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationStack {
            TodayForecast(city: $viewModel.city)
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $viewModel.isShowingCitiesView, onDismiss: {
                    viewModel.fetchCity(locationManager: locationManager)
                }) {
                    CitiesListView { city in
                        viewModel.city = city
                    }
                }
                .sheet(isPresented: $viewModel.isShowingSettingsView) {
                    SettingsView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        settingsButton
                    }
                    
                    ToolbarItem(placement: .principal) {
                        cityNameButton
                    }
                }
                .onAppear {
                    viewModel.fetchCity(locationManager: locationManager)
                }
                .onChange(of: locationManager.userLocation) { _ in
                    viewModel.fetchCity(locationManager: locationManager)
                }
        }
    }
    
    private var cityNameButton: some View {
        Button {
            viewModel.isShowingCitiesView = true
        } label: {
            Text(viewModel.cityName)
                .font(.title3)
                .fontWeight(.semibold)
                .tint(Color(UIColor.systemBackground))
        }
    }
    
    private var settingsButton: some View {
        Button {
            viewModel.isShowingSettingsView = true
        } label: {
            Image(systemName: "gear")
                .font(.headline)
                .tint(Color(UIColor.systemBackground))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager.shared)
    }
}
