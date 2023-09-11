//
//  ForecastManager.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Combine
import Foundation

struct ForecastManager {
    
    static private var cancellables: Set<AnyCancellable> = []
    
    static func fetchForecast(lat: Double, lon: Double, result: @escaping (Result<Forecast, Error>) -> ()) {
        WeatherAPI.fetchWeatherData(lat: lat, lon: lon)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("DEBUG: Data was received successfully.")
                    return
                    
                case .failure(let error):
                    print("DEBUG: Data was not received successfully.")
                    result(.failure(error))
                }
            } receiveValue: { fetchedForecast in
                result(.success(fetchedForecast))
            }
            .store(in: &cancellables)
    }
    
}
