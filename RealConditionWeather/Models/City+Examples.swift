//
//  City+Examples.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 15/08/2023.
//

import CoreLocation

extension City {
    static let allCities = [paris, geneva, florence, london, newYork, cupertino]

    static let paris = City(name: "Paris", country: "France")
    static let geneva = City(name: "Geneva", country: "Switzerland")
    static let florence = City(name: "Florence", country: "Italy")
    static let london = City(name: "London", country: "United-Kingdom")
    static let newYork = City(name: "New-York", country: "United-States")
    static let cupertino = City(name: "Cupertino", country: "United-States")
}
