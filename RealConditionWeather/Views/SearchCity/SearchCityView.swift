//
//  SearchCityView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import SwiftUI

struct SearchCityView: View {
    @StateObject private var citySearcher = CitySearcher()

    var body: some View {
        VStack(alignment: .leading) {
            Text("RealCondition Weather")
                .font(.title)
            Text("Search for a town to obtain weather data")
                .font(.headline)
                .padding(.bottom, 16)

            TextField("Search City", text: $citySearcher.userInput)
                .textFieldStyle(.roundedBorder)

            List(citySearcher.results, id: \.hash) { result in
                Button(action: {}) {
                    CityCell(result: result)
                }
                .foregroundStyle(.primary)
            }
            .overlay {
                if citySearcher.results.isEmpty && citySearcher.userInput.isEmpty {
                    ContentUnavailableView("Search for a Place",
                                           systemImage: "cloud.sun",
                                           description: Text("Where do you want to go?"))
                }
            }
            .overlay {
                if citySearcher.results.isEmpty && !citySearcher.userInput.isEmpty {
                    ContentUnavailableView.search(text: citySearcher.userInput)
                }
            }
        }
        .padding(32)
    }
}

#Preview {
    SearchCityView()
}
