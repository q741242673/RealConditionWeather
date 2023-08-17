//
//  MKLocalSearchCompletion+Transform.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 18/08/2023.
//

import MapKit

extension MKLocalSearchCompletion {
    func transformToLocation() async throws -> CLLocation? {
        let geocoder = CLGeocoder()

        let placemarks = try await geocoder.geocodeAddressString("\(title), \(subtitle)")
        return placemarks.first?.location
    }
}
