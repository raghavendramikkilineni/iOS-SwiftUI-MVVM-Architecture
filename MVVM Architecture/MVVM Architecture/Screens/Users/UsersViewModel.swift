//
//  UsersViewModel.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Combine

extension UsersView {
    class ViewModel: ObservableObject {
        @Published var users: Loadable<Array<UserPresentationModel>> = .notRequested
        var container: DIContainer
        private var cancelBag = CancelBag()
        
        init(container: DIContainer) {
            self.container = container
            fetchUsers()
        }
        
        private func fetchUsers() {
            container.services.userService.fetchUsers(data: loadableSubject(\.users))
        }
        
        func favoriteTapped(_ index: Int) {
            users.bindingUnwrappedValue[index].isFavorite.toggle()
        }
    }
}
