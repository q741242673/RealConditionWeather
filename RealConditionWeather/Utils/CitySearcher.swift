//
//  CitySearcher.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 29/06/2023.
//

import Foundation
import MapKit

final class CitySearcher: NSObject, ObservableObject {
    var userInput = "" {
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
}

extension CitySearcher: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results
    }
}
