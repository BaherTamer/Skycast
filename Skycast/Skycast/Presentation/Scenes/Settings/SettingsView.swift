//
//  SettingsView.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    var body: some View {
        NavigationStack {
            Form {
                appearanceSection
            }
            .navigationTitle(String(localized: "settings"))
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
    }
}
