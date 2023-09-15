//
//  ForecastInfoItem.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct ForecastInfoItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let forecastInfo: ForecastInfo
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: forecastInfo.icon)
                .font(.title)
                .fontWeight(.semibold)
                .padding(8)
                .background(colorScheme == .dark ? Color(UIColor.systemGray5) : Color(UIColor.systemGray6))
                .foregroundStyle(forecastInfo.color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(forecastInfo.localizedText)
                    .font(.headline)
                
                Text(title)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ForecastInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        ForecastInfoItem(forecastInfo: .wind, title: "Wind")
    }
}
