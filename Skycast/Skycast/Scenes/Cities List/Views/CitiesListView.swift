//
//  CitiesListView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct CitiesListView: View {
    
    @StateObject private var viewModel = CitiesListViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("City name", text: $viewModel.newCityName)
                } header: {
                    Text("Add new city")
                }
                
                if !viewModel.cities.isEmpty {
                    historySection
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        viewModel.addButtonPressed()
                    }
                }
            }
        }
    }
    
    private var historySection: some View {
        Section {
            List {
                ForEach(viewModel.cities, id: \.self) { city in
                    Text(city.name)
                }
            }
        } header: {
            Text("History")
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView()
    }
}
