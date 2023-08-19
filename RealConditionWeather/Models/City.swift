//
//  City.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 15/08/2023.
//

import CoreLocation
import MapKit

// TODO: Bring SwiftData when @Model get supported on VisionOS

final class City: Identifiable {
    var name: String
    var country: String
    var placemark: CLPlacemark?

    init(name: String, country: String) {
        self.name = name
        self.country = country
    }

    convenience init(searchCompletion: MKLocalSearchCompletion) {
        self.init(name: searchCompletion.title, country: searchCompletion.subtitle)
    }

    func fetchPlacemark() async throws -> CLPlacemark? {
        guard placemark == nil else { return placemark }

        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.geocodeAddressString("\(name), \(country)")
        placemark = placemarks.first

        return placemark
    }
}

extension City: Hashable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name && lhs.country == rhs.country
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(country)
    }
}
