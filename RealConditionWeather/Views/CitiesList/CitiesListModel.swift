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

        withAnimation {
            cities = completer.results.map { searchCompletion in
                City(searchCompletion: searchCompletion)
            }
        }
    }

    private func getStoredCities() {
        withAnimation {
            cities = City.allCities
        }
    }
}
