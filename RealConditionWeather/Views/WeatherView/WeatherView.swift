//
//  WeatherView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var isShowingSearchSheet = false

    let city: City

    var body: some View {
        VStack {
            Text("Coucou")
        }
        .navigationTitle("\(city.name)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isShowingSearchSheet = true
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                }

            }
        }
        .sheet(isPresented: $isShowingSearchSheet) {
            SearchCityView()
        }
    }
}

#Preview {
    WeatherView(city: .paris)
}
