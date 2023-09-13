//
//  TodayForecastViewModel.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Combine
import SwiftUI

@MainActor final class TodayForecastViewModel: ObservableObject {
    
    @Published private var forecast: Forecast?
    
    let forecastInfoGridColumns = Array(repeating: GridItem(.flexible()), count: 2)
    
    func fetchForecast(for city: City) {
        ForecastAPIManager.fetchForecast(for: city) { [weak self] fetchedForecast in
            self?.forecast = fetchedForecast
        }
    }
}

// MARK: - Data Formatter
extension TodayForecastViewModel {
    var temperature: String {
        "\(Int(forecast?.current.temp ?? 0))"
    }
    
    var date: Date {
        forecast?.current.dt ?? .now
    }
    
    var weatherId: Int? {
        forecast?.current.weather.first?.id
    }
    
    var description: String {
        forecast?.current.weather.first?.description.capitalized ?? "Unknown"
    }
    
    var windSpeed: String {
        "\(forecast?.current.windSpeed ?? 0) \(String(localized: "km/h"))"
    }
    
    var feelsLike: String {
        "\(forecast?.current.feelsLike ?? 0)°"
    }
    
    var humidity: String {
        "\(forecast?.current.humidity ?? 0)%"
    }
    
    var pressure: String {
        "\(forecast?.current.pressure ?? 0) \(String(localized: "hpa"))"
    }
    
    var hourlyForecast: [Current] {
        forecast?.hourly ?? []
    }
    
    var dailyForecast: [Daily] {
        forecast?.daily ?? []
    }
}
