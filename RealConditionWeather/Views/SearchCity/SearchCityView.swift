//
//  SearchCityView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import MapKit
import SwiftUI

struct SearchCityView: View {
    @State private var citySearcher = CitySearcher()

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Search", text: $citySearcher.completer.queryFragment)
                .textFieldStyle(.roundedBorder)

            List(citySearcher.results, id: \.hash) { result in
                NavigationLink(value: result) {
                    CityCell(result: result)
                }
            }
            .overlay {
                if citySearcher.results.isEmpty {
                    if citySearcher.completer.queryFragment.isEmpty {
                        ContentUnavailableView("Search for a Place", systemImage: "cloud.sun", description: Text("where are we going today?"))
                    } else {
                        ContentUnavailableView.search(text: citySearcher.completer.queryFragment)
                    }
                }
            }
        }
        .padding(32)
        .navigationTitle("Real Condition Weather")
        .navigationDestination(for: MKLocalSearchCompletion.self) { destination in
            WeatherView()
        }
    }
}

#Preview {
    SearchCityView()
}
