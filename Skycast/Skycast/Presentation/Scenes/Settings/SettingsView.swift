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
            .navigationTitle("Settings")
        }
    }
    
    private var appearanceSection: some View {
        Section {
            colorSchemePicker
        } header: {
            Text("Appearance")
        }
    }
    
    private var colorSchemePicker: some View {
        Picker(selection: colorSchemeManager.$schemeType) {
                Text("Light").tag(SchemeType.light)
                Text("Dark").tag(SchemeType.dark)
                Text("System").tag(SchemeType.unspecified)
            } label: {
                SettingsRowIcon(icon: "circle.lefthalf.filled", text: "Dark Mode", color: .gray)
            }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
