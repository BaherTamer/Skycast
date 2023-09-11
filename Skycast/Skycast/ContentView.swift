//
//  ContentView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TodayForecast()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
