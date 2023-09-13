//
//  SkycastApp.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

@main
struct SkycastApp: App {
    
    // MARK: Dark Mode Variables
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    @AppStorage("SchemeType") private var schemeType: SchemeType = .unspecified
    
    @StateObject var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkManager)
            
                // Dark Mode Configurations
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
