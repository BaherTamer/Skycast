//
//  DailyForecastCardItem.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

struct DailyForecastCardItem: View {
    
    private let forecastInfoGridColumns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                VStack(alignment: .leading) {
                    Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                        .font(.headline)
                    
                    Text("Broken Clouds")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
                Spacer()
                
                Text("35")
                    .font(.system(.title, design: .rounded, weight: .bold))
            }
            
            Divider()
            
            forecastInfoGrid
        }
        .padding()
        .background(.background)
        .cornerRadius(12)
        .padding()
    }
    
    private var forecastInfoGrid: some View {
        LazyVGrid(columns: forecastInfoGridColumns) {
            ForecastInfoItem(forecastInfo: .wind, title: "Wind")
            ForecastInfoItem(forecastInfo: .feelsLike, title: "Feels Like")
            ForecastInfoItem(forecastInfo: .humidity, title: "Humidity")
            ForecastInfoItem(forecastInfo: .pressure, title: "Pressure")
        }
    }
}

struct DailyForecastCardItem_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastCardItem()
    }
}
