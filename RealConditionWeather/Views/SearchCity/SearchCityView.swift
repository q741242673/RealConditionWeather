//
//  SearchCityView.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 28/06/2023.
//

import OSLog
import MapKit
import SwiftUI

struct SearchCityView: View {
    @StateObject private var citySearcher = CitySearcher()

    @State private var isShowingErrorAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("RealCondition Weather")
                .font(.title)
            Text("Search for a town to obtain weather data")
                .font(.headline)
                .padding(.bottom, 16)

            TextField("Search City", text: $citySearcher.userInput)
                .textFieldStyle(.roundedBorder)

            List(citySearcher.results, id: \.hash) { result in
                Button {
                    getWeatherFor(place: result)
                } label: {
                    CityCell(result: result)
                }
                .foregroundStyle(.primary)
            }
            .overlay {
                if citySearcher.results.isEmpty {
                    if citySearcher.userInput.isEmpty {
                        ContentUnavailableView("Search for a Place", systemImage: "cloud.sun", description: Text("where are we going today?"))
                    } else {
                        ContentUnavailableView.search(text: citySearcher.userInput)
                    }
                }
            }
        }
        .padding(32)
        .alert("Impossible to retrieve location", isPresented: $isShowingErrorAlert) {
            Button("Cancel", role: .cancel) {}
        }
    }

    private func getWeatherFor(place: MKLocalSearchCompletion) {
        Task {
            do {
                guard let location = try await citySearcher.transformToLocation(place: place) else {
                    isShowingErrorAlert = true
                    return
                }

                // TODO: Do something with CLLocation
            } catch {
                isShowingErrorAlert = true

                let logger = Logger(fromView: SearchCityView.self)
                logger.error("\(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SearchCityView()
}
