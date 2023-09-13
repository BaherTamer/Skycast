//
//  DailyForecast.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

struct DailyForecast: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let dailyForecast: [Daily]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(dailyForecast, id: \.dt) { forecast in
                DailyForecastCardItem(forecast: forecast)
            }
        }
        .navigationTitle("Daily Forecast")
        .background(colorScheme == .dark ? Color(UIColor.systemGray5) : Color(UIColor.systemGray6))
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecast(dailyForecast: [])
    }
}
