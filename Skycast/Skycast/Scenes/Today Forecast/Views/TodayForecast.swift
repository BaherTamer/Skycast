//
//  TodayForecast.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct TodayForecast: View {
    
    private let forecastInfoGridColumns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            headerSection
            
            VStack(spacing: 32) {
                forecastInfoHeader
                
                forecastInfoGrid
                
                Divider()
                
                hourlyForecastInfo
            }
            .padding(.horizontal)
            .padding(.vertical, 24)
            .background(.background)
            .cornerRadius(12)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding()
        .background(.blue.gradient)
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("34.5°")
                .font(.system(size: 64, design: .rounded))
                .fontWeight(.bold)
            
            Text("Broken Clouds")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Sunday, 10 Sep 2023 10:15 PM")
                .font(.headline)
        }
        .foregroundStyle(.ultraThickMaterial)
        .frame(maxHeight: .infinity)
    }
    
    private var forecastInfoHeader: some View {
        HStack {
            Text("Today's")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {
                // TODO: Navigation to daily forecast
            } label: {
                HStack {
                    Text("5-Days Forecast")
                    Image(systemName: "chevron.right")
                }
                .font(.headline)
            }
        }
    }
    
    private var forecastInfoGrid: some View {
        LazyVGrid(columns: forecastInfoGridColumns) {
            ForecastInfoItem(forecastInfo: .wind, title: "Wind")
            ForecastInfoItem(forecastInfo: .feelsLike, title: "Feels Like")
            ForecastInfoItem(forecastInfo: .humidity, title: "Humidity")
            ForecastInfoItem(forecastInfo: .pressure, title: "Pressure")
        }
    }
    
    private var hourlyForecastInfo: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...10, id: \.self) { _ in
                    HourlyForecastItem()
                }
            }
        }
    }
}

struct TodayForecast_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodayForecast()
        }
    }
}
