//
//  MainView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationSplitView {
            List(City.allCities) { city in
                NavigationLink(value: city) {
                    Text(city.name)
                }
            }
            .navigationDestination(for: City.self) { city in
                WeatherView(city: city)
            }
        } detail: {
            WeatherView(city: .paris)
        }
    }
}

#Preview {
    MainView()
}
