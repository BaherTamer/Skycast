//
//  DailyForecast.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

struct DailyForecast: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(1...5, id: \.self) { _ in
                DailyForecastCardItem()
            }
        }
        .navigationTitle("5-Days Forecast")
        .background(Color(UIColor.systemGray6))
    }
}

struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecast()
    }
}
