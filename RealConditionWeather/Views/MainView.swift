//
//  MainView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct MainView: View {
    @State private var currentCity: City? = .paris

    var body: some View {
        NavigationSplitView {
            CitiesList(currenCity: $currentCity)
        } detail: {
            WeatherView(city: currentCity ?? .paris)
        }
        
    }
}

#Preview {
    MainView()
}
