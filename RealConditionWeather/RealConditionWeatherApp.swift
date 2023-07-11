//
//  RealConditionWeatherApp.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import SwiftUI

@main
struct RealConditionWeatherApp: App {
    static let mainWindow = "SearchWindow"
    static let immersiveSpace = "ImmersiveSpace"

    @State private var model = RealConditionModel()
    @State private var immersionStyle: ImmersionStyle = .mixed

    var body: some Scene {
        WindowGroup("Real Condition Weather", id: Self.mainWindow) {
            MainView()
                .environment(model)
        }

        ImmersiveSpace(id: Self.immersiveSpace) {
            Text("Coucou")
        }
        .immersionStyle(selection: $immersionStyle, in: .mixed)
    }
}
