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
    
    var completion: (City) -> ()
    
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
                        viewModel.addButtonPressed { city in
                            completion(city)
                            dismiss()
                        }
                    }
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
            Text("History")
        }
    }
    
    private func histroyRow(city: City) -> some View {
        HStack {
            Button(city.name) {
                viewModel.updateCity(city)
                completion(city)
                dismiss()
            }
            .tint(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Color(UIColor.systemGray2))
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(completion: {_ in})
    }
}
