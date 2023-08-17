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
final class CitySearcher: NSObject {
    var completer = MKLocalSearchCompleter()
    private(set) var results = City.allCities

    var hasNoResult: Bool {
        return !completer.queryFragment.isEmpty && results.isEmpty
    }

    override init() {
        super.init()

        completer.delegate = self
        completer.resultTypes = .address
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension CitySearcher: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        guard !completer.queryFragment.isEmpty else {
            withAnimation {
                results = City.allCities
            }
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
                results = newResults
            }
        }
    }
}
