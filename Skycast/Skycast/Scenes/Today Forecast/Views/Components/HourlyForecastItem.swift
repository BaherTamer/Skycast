//
//  HourlyForecastItem.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct HourlyForecastItem: View {
    
    var currentHourForcast: Current
    
    var body: some View {
        VStack(spacing: -4) {
            Text(currentHourForcast.dt, formatter: DateFormatter.timeFormatter)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForecastIcon(icon: currentHourForcast.weather.first?.icon ?? "10d")
            
            Text("\(Int(currentHourForcast.temp).description)°")
                .font(.headline)
        }
        .padding(.horizontal, 8)
    }
}

