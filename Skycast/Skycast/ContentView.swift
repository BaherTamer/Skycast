//
//  ContentView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkManager: NetworkManager
    
    @StateObject private var viewModel = ContentViewModel()
    @ObservedObject private var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationStack {
            TodayForecast(city: $viewModel.city)
                .navigationBarTitleDisplayMode(.inline)
                // MARK: Alerts
                .alert(viewModel.networkAlertTitle, isPresented: $viewModel.isShowingNetworkAlert, actions: {
                    networkTryAgainButton
                }, message: {
                    Text(viewModel.networkAlertMessage)
                })
            
                // MARK: Sheets
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
            
                // MARK: Toolbar
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        settingsButton
                    }
                    
                    ToolbarItem(placement: .principal) {
                        cityNameButton
                    }
                }
            
                // MARK: Configurations
                .onAppear {
                    viewModel.fetchCity(locationManager: locationManager)
                }
                .onChange(of: locationManager.userLocation) { _ in
                    viewModel.fetchCity(locationManager: locationManager)
                }
                .onChange(of: networkManager.isConnected) { connection in
                    viewModel.isShowingNetworkAlert = connection == false
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
    
    private var networkTryAgainButton: some View {
        Button("Try again") {
            viewModel.fetchCity(locationManager: locationManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NetworkManager())
            .environmentObject(LocationManager.shared)
    }
}
