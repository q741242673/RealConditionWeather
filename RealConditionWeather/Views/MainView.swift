//
//  MainView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import CoreLocation
import SwiftUI

struct MainView: View {
    @Environment(RealConditionModel.self) private var model

    var body: some View {
        switch model.currentScreen {
        case .search:
            SearchCityView()
        case .weather:
            WeatherView()
        }
    }
}

#Preview {
    MainView()
        .environment(RealConditionModel())
}
