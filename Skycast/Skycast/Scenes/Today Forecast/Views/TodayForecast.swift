//
//  TodayForecast.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct TodayForecast: View {
    
    @Binding var city: City
    @StateObject private var viewModel = TodayForecastViewModel()
    
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
        .onAppear {
            viewModel.fetchForecast(for: city)
        }
        .onChange(of: city) { newValue in
            viewModel.fetchForecast(for: newValue)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                Text(viewModel.temperature)
                    .font(.system(size: 80, design: .rounded))
                    .fontWeight(.bold)
                
                Text("°")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .offset(x: -8)
            }
            .padding(.trailing, -24)
            
            Text(viewModel.description)
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
        LazyVGrid(columns: viewModel.forecastInfoGridColumns) {
            ForecastInfoItem(forecastInfo: .wind, title: viewModel.windSpeed)
            ForecastInfoItem(forecastInfo: .feelsLike, title: viewModel.feelsLike)
            ForecastInfoItem(forecastInfo: .humidity, title: viewModel.humidity)
            ForecastInfoItem(forecastInfo: .pressure, title: viewModel.pressure)
        }
    }
    
    private var hourlyForecastInfo: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.hourlyForecast, id: \.dt) { hour in
                    HourlyForecastItem(currentHourForcast: hour)
                }
            }
        }
    }
}

struct TodayForecast_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodayForecast(city: .constant(City(name: "Cairo", lat: 30, lon: 30)))
        }
    }
}
