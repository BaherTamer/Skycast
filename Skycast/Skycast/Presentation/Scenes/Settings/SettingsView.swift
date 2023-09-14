//
//  SettingsView.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @EnvironmentObject var temperatureManager: TemperatureManager
    
    var body: some View {
        NavigationStack {
            Form {
                generalSection
                appearanceSection
            }
            .navigationTitle(String(localized: "settings"))
        }
    }
    
    private var generalSection: some View {
        Section {
            temperatureDegreePicker
            notificationSettings
        } header: {
            Text(String(localized: "general"))
        }
    }
    
    private var temperatureDegreePicker: some View {
        Picker(selection: temperatureManager.$degreeType) {
            Text(String(localized: "celsius")).tag(DegreeType.celsius)
            Text(String(localized: "fahrenheit")).tag(DegreeType.fahrenheit)
        } label: {
            SettingsRowIcon(icon: "thermometer.medium", text: String(localized: "temperatureDegree"), color: .orange)
        }
    }
    
    private var notificationSettings: some View {
        NavigationLink {
            NotificationsSettings()
        } label: {
            SettingsRowIcon(icon: "bell.fill", text: String(localized: "notifications"), color: .red)
        }

    }
    
    private var appearanceSection: some View {
        Section {
            colorSchemePicker
        } header: {
            Text(String(localized: "appearance"))
        }
    }
    
    private var colorSchemePicker: some View {
        Picker(selection: colorSchemeManager.$schemeType) {
                Text(String(localized: "light")).tag(SchemeType.light)
                Text(String(localized: "dark")).tag(SchemeType.dark)
                Text(String(localized: "automatic")).tag(SchemeType.unspecified)
            } label: {
                SettingsRowIcon(icon: "circle.lefthalf.filled", text: String(localized: "darkMode"), color: .gray)
            }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TemperatureManager())
            .environmentObject(ColorSchemeManager())
    }
}
