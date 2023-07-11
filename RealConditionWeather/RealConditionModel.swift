//
//  RealConditionModel.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 11/07/2023.
//

import CoreLocation
import Foundation
import Observation

enum WeatherScreen {
    case search, weather
}

@Observable
final class RealConditionModel {
    var weatherLocation: CLLocation? = nil

    var currentScreen: WeatherScreen {
        if weatherLocation == nil {
            return .search
        }
        return .weather
    }
}
