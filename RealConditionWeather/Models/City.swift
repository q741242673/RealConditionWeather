//
//  City.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 15/08/2023.
//

import CoreLocation
import MapKit

// TODO: Bring SwiftData when @Model is supported on VisionOS

final class City: Identifiable {
    var id: CLLocationCoordinate2D { location.coordinate }

    var name: String
    var location: CLLocation

    init(name: String, location: CLLocation) {
        self.name = name
        self.location = location
    }

    convenience init?(from result: MKLocalSearchCompletion) async {
        guard let location = try? await result.transformToLocation() else { return nil }
        self.init(name: result.title, location: location)
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
