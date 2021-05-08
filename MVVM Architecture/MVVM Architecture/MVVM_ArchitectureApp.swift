//
//  MVVM_ArchitectureApp.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import SwiftUI

@main
struct MVVM_ArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            let realWebRepository = RealWebRepository(session: URLSession.urlSession)
            let userService = RealUserService(webRepository: realWebRepository)
            let service = DIContainer.Services(userService: userService)
            let container = DIContainer(services: service)
            UsersView(viewModel: UsersView.ViewModel(container: container))
        }
    }
}
