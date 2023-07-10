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
    var results = [MKLocalSearchCompletion]()

    override init() {
        super.init()

        completer.delegate = self
        completer.resultTypes = .address
    }

    func transformToLocation(place: MKLocalSearchCompletion) async throws -> CLLocation? {
        let geocoder = CLGeocoder()

        let placemarks = try await geocoder.geocodeAddressString("\(place.title), \(place.subtitle)")
        return placemarks.first?.location
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension CitySearcher: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        withAnimation {
            results = completer.results
        }
    }
}
