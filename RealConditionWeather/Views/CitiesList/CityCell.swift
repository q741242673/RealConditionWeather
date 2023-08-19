//
//  CityCell.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 16/08/2023.
//

import CoreLocation
import SwiftUI

struct CityCell: View {
    @State private var placemark: CLPlacemark?

    let city: City

    private var dateFormatter: Date.FormatStyle? {
        guard let timeZone = placemark?.timeZone else { return nil }

        var formatter = Date.FormatStyle.dateTime.hour().minute()
        formatter.timeZone = timeZone
        return formatter
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.headline)

                Group {
                    if let dateFormatter {
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
            placemark = try? await city.fetchPlacemark()
        }
    }
}

#Preview {
    CityCell(city: .paris)
}
