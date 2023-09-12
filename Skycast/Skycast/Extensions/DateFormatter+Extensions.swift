//
//  DateFormatter+Extensions.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import Foundation

extension DateFormatter {
    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter
    }
}
