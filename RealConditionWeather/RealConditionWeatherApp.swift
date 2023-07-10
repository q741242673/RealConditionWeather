//
//  RealConditionWeatherApp.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import CoreLocation
import SwiftUI

@main
struct RealConditionWeatherApp: App {
    static let mainWindow = "SearchWindow"
    static let immersiveSpace = "ImmersiveSpace"

    @State private var immersionStyle: ImmersionStyle = .mixed
    @State private var weatherLocation: CLLocation?

    var body: some Scene {
        WindowGroup("Real Condition Weather", id: Self.mainWindow) {
            SearchCityView(weatherLocation: $weatherLocation)
        }

        ImmersiveSpace(id: Self.immersiveSpace) {
            Text("Coucou -> \(weatherLocation.debugDescription)")
        }
        .immersionStyle(selection: $immersionStyle, in: .mixed)
    }
}
