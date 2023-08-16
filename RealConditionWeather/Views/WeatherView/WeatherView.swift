//
//  WeatherView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct WeatherView: View {
    let city: City

    var body: some View {
        VStack {
            Text("Coucou")
        }
        .navigationTitle("\(city.name)")
    }
}

#Preview {
    WeatherView(city: .paris)
}
