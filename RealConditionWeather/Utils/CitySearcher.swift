//
//  CitySearcher.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 29/06/2023.
//

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
}

extension CitySearcher: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        withAnimation {
            results = completer.results
        }
    }
}
