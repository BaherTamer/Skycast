//
//  ContentView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationStack {
            TodayForecast()
                .onAppear {
                    locationManager.checkLocationAuthorization()
                }
                .sheet(isPresented: $locationManager.servicesIsDenied) {
                    Text("Hello, world!")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
