//
//  CitySearcher.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 29/06/2023.
//

import CoreLocation
import Foundation
import MapKit
import SwiftUI

final class CitySearcher: NSObject, ObservableObject {
    @Published var userInput = "" {
        didSet {
            completer.queryFragment = userInput
        }
    }
    @Published var results = [MKLocalSearchCompletion]()

    private let completer: MKLocalSearchCompleter

    override init() {
        completer = MKLocalSearchCompleter()
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

extension CitySearcher: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        withAnimation {
            results = completer.results
        }
    }
}
