//
//  WeatherAPI.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Combine
import Foundation

struct WeatherAPI {
    static func fetchWeatherData(lat: Double, lon: Double) -> AnyPublisher<Forecast, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=\(API.key)") else {
            print("DEBUG: Invalid weather URL,")
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap(getData)
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private static func getData(data: Data, response: URLResponse) throws -> Data {
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
