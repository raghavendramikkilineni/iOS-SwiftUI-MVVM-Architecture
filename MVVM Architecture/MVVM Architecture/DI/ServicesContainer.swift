//
//  ServicesContainer.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation

extension DIContainer {
    struct Services {
        let userService: UserSevice
        
        init(userService: UserSevice) {
            self.userService = userService
        }
        
        static var stub: Self {
            .init(userService: StubUserService())
        }
    }
}

