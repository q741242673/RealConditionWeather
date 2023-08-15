//
//  RealConditionWeatherApp.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import SwiftUI

@main
struct RealConditionWeatherApp: App {
    var body: some Scene {
        WindowGroup(id: Self.mainWindow) {
            MainView()
        }

        // TODO: Add Immersive space with real weather conditions
        ImmersiveSpace(id: Self.immersiveSpace) {
            Text("Immersive view goes here.")
        }
    }
}

// MARK: - Scene ids

extension RealConditionWeatherApp {
    static let mainWindow = "MainWindow"
    static let immersiveSpace = "ImmersiveSpace"
}
