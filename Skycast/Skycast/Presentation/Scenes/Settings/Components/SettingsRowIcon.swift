//
//  SettingsRowIcon.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

struct SettingsRowIcon: View {
    
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .fontWeight(.bold)
//                .symbolRenderingMode(.hierarchical)
                .shadow(color: .gray.opacity(0.1), radius: 2)
                .frame(width: 35, height: 35)
                .foregroundStyle(color.gradient)
                .background(color.opacity(0.15))
                .cornerRadius(6)
            
            Text(text)
        }
        .padding(.vertical, 2)
    }
}

struct SettingsRowIcon_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowIcon(icon: "star.fill", text: "Rate", color: .yellow)
    }
}
