//
//  DailyForecastCardItem.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

struct DailyForecastCardItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let forecast: Daily
    private let forecastInfoGridColumns = Array(repeating: GridItem(.flexible()), count: 2)
    
    private var windSpeed: String {
        "\(forecast.windSpeed) km/h"
    }
    
    private var feelsLike: String {
        "\(forecast.feelsLike.day)°"
    }
    
    private var humidity: String {
        "\(forecast.humidity)%"
    }
    
    private var pressure: String {
        "\(forecast.pressure) hPa"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ForecastIcon(icon: forecast.weather.first?.icon ?? "10d")
                
                VStack(alignment: .leading) {
                    Text(forecast.dt, formatter: DateFormatter.dateFormatter)
                        .font(.headline)
                    
                    Text(forecast.weather.first?.description ?? "Unknown")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
                Spacer()
                
                HStack(alignment: .top) {
                    Text(Int(forecast.temp.day).description)
                        .font(.system(.title, design: .rounded, weight: .bold))
                    
                    Text("°")
                        .font(.headline)
                }
            }
            
            Divider()
            
            forecastInfoGrid
        }
        .padding()
        .background(colorScheme == .dark ? Color(UIColor.systemGray6) : .white)
        .cornerRadius(12)
        .padding()
    }
    
    private var forecastInfoGrid: some View {
        LazyVGrid(columns: forecastInfoGridColumns) {
            ForecastInfoItem(forecastInfo: .wind, title: windSpeed)
            ForecastInfoItem(forecastInfo: .feelsLike, title: feelsLike)
            ForecastInfoItem(forecastInfo: .humidity, title: humidity)
            ForecastInfoItem(forecastInfo: .pressure, title: pressure)
        }
    }
}
