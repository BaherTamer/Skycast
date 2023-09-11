//
//  HourlyForecastItem.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct HourlyForecastItem: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Wind")
            Image(systemName: "wind.circle.fill")
                .font(.largeTitle)
            Text("34.5")
        }
        .padding(.horizontal, 8)
    }
}

struct HourlyForecastItem_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastItem()
    }
}
