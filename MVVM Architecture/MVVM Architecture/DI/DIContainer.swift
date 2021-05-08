//
//  DIContainer.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {
    var services: Services
    static var defaultValue: Self { Self.default}
    private static let `default` = DIContainer(services: .stub)
    
    init(services: DIContainer.Services) {
        self.services = services
    }
    
    struct WebRepositories {
        let defaultWebRepository: WebRepository
    }
}

