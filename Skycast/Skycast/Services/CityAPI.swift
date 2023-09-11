//
//  CityAPI.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Combine
import Foundation

struct CityAPI {
    static func fetchCity(for name: String) -> AnyPublisher<[City], Error> {
            let url = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(name.capitalized)&limit=1&appid=\(API.key)")!

            return URLSession.shared
                .dataTaskPublisher(for: url)
                .tryMap(getData)
                .decode(type: [City].self, decoder: JSONDecoder())
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
