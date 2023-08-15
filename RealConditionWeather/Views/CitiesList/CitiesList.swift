//
//  CitiesList.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 16/08/2023.
//

import SwiftUI

struct CitiesList: View {
    var body: some View {
        List(City.allCities) { city in
            NavigationLink(value: city) {
                Text(city.name)
            }
        }
        .navigationDestination(for: City.self) { city in
            WeatherView(city: city)
        }
    }
}

#Preview {
    CitiesList()
}
