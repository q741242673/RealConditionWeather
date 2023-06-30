//
//  CityCell.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 29/06/2023.
//

import MapKit
import SwiftUI

struct CityCell: View {
    let result: MKLocalSearchCompletion

    private var attributedTitle: AttributedString {
        var attributedString = AttributedString(result.title)

        for currentRange in result.titleHighlightRanges {
            guard let nsRange = currentRange as? NSRange,
                  let range = Range(nsRange, in: attributedString)
            else { continue }

            attributedString[range].font = .system(.body, weight: .bold)
        }

        return attributedString
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            Text(attributedTitle)

            Text(result.subtitle)
                .font(.caption)
        }
    }
}

#Preview {
    CityCell(result: MKLocalSearchCompletion())
}
