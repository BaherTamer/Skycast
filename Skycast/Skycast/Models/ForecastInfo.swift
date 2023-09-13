//
//  ForecastInfo.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

enum ForecastInfo {
    case wind
    case feelsLike
    case humidity
    case pressure
}

extension ForecastInfo {
    var icon: String {
        switch self {
        case .wind:
            return "wind"
        case .feelsLike:
            return "sparkles"
        case .humidity:
            return "humidity"
        case .pressure:
            return "gauge.medium"
        }
    }
}

extension ForecastInfo {
    var localizedText: String {
        switch self {
        case .wind:
            return String(localized: "wind")
        case .feelsLike:
            return String(localized: "feelsLike")
        case .humidity:
            return String(localized: "humidity")
        case .pressure:
            return String(localized: "pressure")
        }
    }
}

extension ForecastInfo {
    var color: Color {
        switch self {
        case .wind:
            return .blue
        case .feelsLike:
            return .green
        case .humidity:
            return .orange
        case .pressure:
            return .indigo
        }
    }
}
