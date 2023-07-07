//
//  Logger+Init.swift
//  RealConditionWeather
//
//  Created by Valentin Perignon on 07/07/2023.
//

import Foundation
import OSLog
import SwiftUI

extension Logger {
    init(fromView viewType: any View.Type) {
        self.init(subsystem: Bundle.main.bundleIdentifier ?? "", category: String(describing: viewType))
    }
}
