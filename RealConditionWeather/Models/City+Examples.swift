//
//  City+Examples.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 15/08/2023.
//

import CoreLocation

extension City {
    static let allCities = [paris, geneva, florence, london, newYork, cupertino]

    static let paris = City(name: "Paris", country: "France", location: CLLocation(latitude: 48.85, longitude: 2.33))
    static let geneva = City(name: "Geneva", country: "Switzerland", location: CLLocation(latitude: 46.23, longitude: 6.07))
    static let florence = City(name: "Florence", country: "Italy", location: CLLocation(latitude: 43.77, longitude: 11.26))
    static let london = City(name: "London", country: "United Kingdom", location: CLLocation(latitude: 51.50, longitude: -0.12))
    static let newYork = City(name: "New-York", country: "United-States", location: CLLocation(latitude: 40.74, longitude: -73.99))
    static let cupertino = City(name: "Cupertino", country: "United-States", location: CLLocation(latitude: 37.32, longitude: -122.03))
}
