//
//  MainView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct MainView: View {
    @State private var currentCity: City? = .paris
    @State private var citySearcher = CitySearcher()

    var body: some View {
        NavigationSplitView {
            CitiesList(currenCity: $currentCity, citySearcher: $citySearcher)
        } detail: {
            WeatherView(city: currentCity ?? .paris)
        }
        .searchable(text: $citySearcher.completer.queryFragment)
    }
}

#Preview {
    MainView()
}
