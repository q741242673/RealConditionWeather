//
//  CitiesList.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 16/08/2023.
//

import MapKit
import SwiftUI

struct CitiesList: View {
    @Binding var currenCity: City?
    @Binding var citySearcher: CitySearcher

    var body: some View {
        List(citySearcher.results, selection: $currenCity) { city in
            NavigationLink(value: city) {
                CityCell(city: city)
            }
        }
        .navigationTitle("Places")
        .navigationDestination(for: City.self) { city in
            WeatherView(city: city)
        }
        .overlay {
            if citySearcher.hasNoResult {
                ContentUnavailableView.search(text: citySearcher.completer.queryFragment)
            }
        }
    }
}

#Preview {
    CitiesList(currenCity: .constant(.paris), citySearcher: .constant(CitySearcher()))
}
