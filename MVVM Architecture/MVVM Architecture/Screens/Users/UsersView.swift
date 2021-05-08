//
//  UsersView.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject private(set) var viewModel: UsersView.ViewModel
    
    var body: some View {
        NavigationView {
            content
                .background(Assests.Color.background)
                .navigationBarTitle(UsersView.title)
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarColor(backgroundColor: UIColor(Assests.Color.barColor), tintColor: UIColor(Assests.Color.titleColor))
    }
    
    private static let title = "Users"
    private static let emptyUsers = "Empty users, Please add users."
    private static let emptyUsersIcon = "tornado"
    private static let errorIcon = "xmark.octagon"
}

extension UsersView: LoadableView {
    typealias Result = Array<UserPresentationModel>
    internal var content: AnyView {
        let users = viewModel.users
        switch users {
        case .notRequested: return notRequestedView()
        case let .isLoading(last, _): return loadingView(last)
        case let .loaded(data): return loadedView(data)
        case let .failed(error): return failedView(error)
        }
    }
    
    func notRequestedView() -> AnyView {
        EmptyListView(title: UsersView.emptyUsers, iconName: UsersView.emptyUsersIcon)
            .anyView()
    }
    
    func loadingView(_ previouslyLoaded: Array<UserPresentationModel>?) -> AnyView {
        LoadingView()
            .anyView()
    }
    
    func failedView(_ error: Error) -> AnyView {
        EmptyListView(title: error.localizedDescription, iconName: UsersView.errorIcon)
            .anyView()
    }
    
    func loadedView(_ result: Array<UserPresentationModel>) -> AnyView {
        usersList(result)
            .anyView()
    }
    
    private func usersList(_ result: Array<UserPresentationModel>) -> AnyView {
        UsersList {
            ForEach(0..<result.count, id: \.self) { index in
                UserCell(favoriteTapped: { viewModel.favoriteTapped(index) },
                         user: result[index])
            }
        }
        .anyView()
    }
}
