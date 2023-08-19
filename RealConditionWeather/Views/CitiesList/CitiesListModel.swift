//
//  CitySearcher.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 29/06/2023.
//

import CoreLocation
import Foundation
import MapKit
import Observation
import SwiftUI

@Observable
final class CitiesListModel: NSObject {
    private var completer = MKLocalSearchCompleter()

    var searchText = "" {
        didSet {
            completer.queryFragment = searchText
            if searchText.isEmpty {
                getStoredCities()
            }
        }
    }
    private(set) var cities = City.allCities

    var hasNoResult: Bool {
        return !searchText.isEmpty && cities.isEmpty
    }

    override init() {
        super.init()

        completer.delegate = self
        completer.resultTypes = .address
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension CitiesListModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        guard !completer.queryFragment.isEmpty else {
            getStoredCities()
            return
        }

        Task {
            var newResults = [City]()
            await withTaskGroup(of: Void.self) { group in
                for result in completer.results {
                    guard let city = await City(from: result) else { continue }
                    newResults.append(city)
                }
            }
            withAnimation {
                cities = newResults
            }
        }
    }

    private func getStoredCities() {
        withAnimation {
            cities = City.allCities
        }
    }
}
