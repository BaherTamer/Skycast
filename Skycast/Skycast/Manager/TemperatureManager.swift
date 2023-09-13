//
//  TemperatureManager.swift
//  Skycast
//
//  Created by Baher Tamer on 13/09/2023.
//

import SwiftUI

enum DegreeType: String {
    case celsius, fahrenheit
}

@MainActor final class TemperatureManager: ObservableObject {
    @AppStorage("DegreeType") var degreeType: DegreeType = .celsius
    
    func getTemperature(_ temperature: Double) -> Int {
        switch degreeType {
        case .celsius:
            return Int(temperature)
        case .fahrenheit:
            return Int((temperature * (9/5)) + 32)
        }
    }
}
