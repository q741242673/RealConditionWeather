//
//  CityCell.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 16/08/2023.
//

import CoreLocation
import SwiftUI

struct CityCell: View {
    @State private var timezone: TimeZone?

    let city: City

    private var dateFormatter: Date.FormatStyle {
        var formatter = Date.FormatStyle.dateTime.hour().minute()
        if let timezone {
            formatter.timeZone = timezone
        }
        return formatter
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.headline)

                Group {
                    if let timezone {
                        Text(Date.now, format: dateFormatter)
                    } else {
                        Text("--:--")
                    }
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer()

            Text("23°")
                .font(.title)
        }
        .task {
            guard let placemark = try? await CLGeocoder().reverseGeocodeLocation(city.location).first else { return }
            timezone = placemark.timeZone
        }
    }
}

#Preview {
    CityCell(city: .paris)
}
