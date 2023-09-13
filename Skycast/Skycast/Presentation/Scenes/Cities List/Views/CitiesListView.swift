//
//  CitiesListView.swift
//  Skycast
//
//  Created by Baher Tamer on 11/09/2023.
//

import SwiftUI

struct CitiesListView: View {
    
    @StateObject private var viewModel = CitiesListViewModel()
    
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.dismiss) var dismiss
    
    var completion: (City) -> ()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(String(localized: "cityName"), text: $viewModel.newCityName)
                } header: {
                    Text(String(localized: "addNewCity"))
                }
                
                if !viewModel.cities.isEmpty {
                    historySection
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(String(localized: "dismiss")) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(String(localized: "add")) {
                        viewModel.addButtonPressed { city in
                            completion(city)
                            dismiss()
                        }
                    }
                    .font(.headline)
                }
            }
        }
    }
    
    private var historySection: some View {
        Section {
            List {
                ForEach(viewModel.cities, id: \.self) { city in
                    histroyRow(city: city)
                }
                .onDelete(perform: viewModel.deleteCity)
            }
        } header: {
            Text(String(localized: "history"))
        }
    }
    
    private func histroyRow(city: City) -> some View {
        HStack {
            Button(viewModel.getCityName(city)) {
                viewModel.updateCity(city)
                completion(city)
                dismiss()
            }
            .tint(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.\(layoutDirection == .leftToRight ? "right" : "left")")
                .foregroundStyle(Color(UIColor.systemGray2))
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(completion: {_ in})
    }
}
