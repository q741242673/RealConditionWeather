//
//  City.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 15/08/2023.
//

import CoreLocation

// TODO: Bring SwiftData when @Model is supported on VisionOS

final class City: Identifiable {
    var id: CLLocationCoordinate2D { location.coordinate }

    var name: String
    var country: String
    var location: CLLocation

    init(name: String, country: String, location: CLLocation) {
        self.name = name
        self.country = country
        self.location = location
    }
}

extension City: Hashable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
