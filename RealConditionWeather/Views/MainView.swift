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
            CitiesList()
        } detail: {
            WeatherView(city: .paris)
        }
    }
}

#Preview {
    MainView()
}
