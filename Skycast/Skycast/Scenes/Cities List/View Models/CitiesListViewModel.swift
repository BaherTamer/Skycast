//
//  CitiesListViewModel.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Combine
import Foundation

@MainActor final class CitiesListViewModel: ObservableObject {
    
    @Published var cities: [City] = []
    @Published var newCityName: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.cities = LocalDataManager.loadCities()
    }
    
    func addButtonPressed() {
        CityAPI.fetchCity(for: newCityName)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    return
                    
                case .failure(let error):
                    print("DEBUG: City was not found,", error)
                }
            } receiveValue: { [weak self] cities in
                if let fetchedCity = cities.first {
                    self?.cities.insert(fetchedCity, at: 0)
                    self?.newCityName = ""
                    
                    self?.saveCitiesLocally()
                }
            }
            .store(in: &cancellables)
    }
    
    func deleteCity(at offsets: IndexSet) {
        self.cities.remove(atOffsets: offsets)
        self.saveCitiesLocally()
    }
    
    private func saveCitiesLocally() {
        LocalDataManager.saveCities(self.cities)
    }
    
}
