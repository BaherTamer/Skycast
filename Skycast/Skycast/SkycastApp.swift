//
//  SkycastApp.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

@main
struct SkycastApp: App {
    
    // MARK: Dark Mode Configurations
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    @AppStorage("SchemeType") private var schemeType: SchemeType = .unspecified
    
    // MARK: Temperature Degree Configurations
    @StateObject private var temperatureManager = TemperatureManager()
    
    // MARK: Network Configurations
    @StateObject var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                
                // Temperature Manager
                .environmentObject(temperatureManager)
            
                // Network Manager
                .environmentObject(networkManager)
            
                // Color Scheme Manager
                .environmentObject(colorSchemeManager)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    colorSchemeManager.applyColorScheme()
                }
                .onChange(of: schemeType) { _ in
                    colorSchemeManager.applyColorScheme()
                }
        }
    }
}
