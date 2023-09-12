//
//  Color+Extensions.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

extension Color {
    
    static func forecastBackground(weatherId: Int?) -> Color {
        
        guard let weatherId else { return .green }
        
        switch weatherId {
        case 200...399:
            return .orange
            
        case 300...499:
            return .gray
            
        case 500...599:
            return .indigo
            
        case 600...699:
            return .cyan
            
        case 700...799:
            return .brown
            
        case 800:
            return .blue
            
        case 801...899:
            return .gray
            
        default:
            return .green
        }
    }
    
}
