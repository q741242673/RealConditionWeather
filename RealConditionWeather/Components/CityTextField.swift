//
//  CityTextField.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 17/08/2023.
//

import SwiftUI

struct CityTextField: View {
    @State private var search = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")

            TextField("Search", text: $search)
        }
    }
}

#Preview {
    CityTextField()
}
