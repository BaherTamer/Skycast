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
        VStack(spacing: 8) {
            Text(currentHourForcast.dt, formatter: DateFormatter.timeFormatter)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Image(systemName: "wind.circle.fill")
                .font(.largeTitle)
            
            Text("\(Int(currentHourForcast.temp).description)°")
                .font(.headline)
        }
        .padding(.horizontal, 8)
    }
}

