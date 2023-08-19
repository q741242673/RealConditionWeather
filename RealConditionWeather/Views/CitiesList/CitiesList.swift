//
//  CitiesList.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 16/08/2023.
//

import MapKit
import SwiftUI

struct CitiesList: View {
    @State private var model = CitiesListModel()

    @Binding var currenCity: City?

    var body: some View {
        List(model.cities, selection: $currenCity) { city in
            NavigationLink(value: city) {
                CityCell(city: city)
            }
        }
        .navigationTitle("Places")
        .navigationDestination(for: City.self) { city in
            WeatherView(city: city)
        }
        .searchable(text: $model.searchText)
        .overlay {
            if model.hasNoResult {
                ContentUnavailableView.search(text: model.searchText)
            }
        }
    }
}

#Preview {
    CitiesList(currenCity: .constant(.paris))
}
