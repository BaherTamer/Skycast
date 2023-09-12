//
//  ForecastIcon.swift
//  Skycast
//
//  Created by Baher Tamer on 12/09/2023.
//

import SwiftUI

struct ForecastIcon: View {
    let icon: String
    let frameSize: CGFloat
    
    private var iconURL: URL? {
        URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
    
    var body: some View {
        AsyncImage(url: iconURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                
            case .failure:
                Image(systemName: "photo")
                    .foregroundColor(.secondary)
                
            @unknown default:
                fatalError()
            }
        }
        .frame(width: frameSize, height: frameSize)
    }
}
