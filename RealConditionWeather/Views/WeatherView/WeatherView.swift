//
//  WeatherView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import SwiftUI

struct WeatherView: View {
    @Environment(RealConditionModel.self) private var model

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    WeatherView()
        .environment(RealConditionModel())
}
