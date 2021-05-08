//
//  UserPresentationModel.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation

struct UserPresentationModel {
    var userId: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var address: String
    var lat: String
    var lng: String
    var companyName: String
    var isFavorite: Bool
}

extension UserPresentationModel: Identifiable {
    var id: String { UUID().uuidString }
}

extension UserPresentationModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(userId)
    }
}

extension UserPresentationModel {
    static func fromDataModel(_ user: User) -> Self {
        return UserPresentationModel(userId: user.userId,
                                     name: user.name,
                                     username: user.username,
                                     email: user.email,
                                     phone: user.phone,
                                     website: user.website, address: "\(user.address.suite) \(user.address.street) \(user.address.city) \(user.address.zipcode)",
                                     lat: user.address.geo.lat, lng: user.address.geo.lng, companyName: user.company.name,
                                     isFavorite: user.isFavorite ?? false)
    }
    
    static func fromLoadableUsers(_ users: Array<User>) -> Array<Self> {
        var usersListPresentable: Array<UserPresentationModel> = Array<UserPresentationModel>()
        for user in users {
            usersListPresentable.append(UserPresentationModel.fromDataModel(user))
        }
        return usersListPresentable
    }
}

extension UserPresentationModel {
    static func loadMock() -> UserPresentationModel {
        return UserPresentationModel(userId: 0,
                                     name: "Raghavendra",
                                     username: "rag_mik",
                                     email: "ragmik@email",
                                     phone: "+91-4234232234",
                                     website: "www.trippycode.com",
                                     address: "Bangalore",
                                     lat: "543543543",
                                     lng: "53454353",
                                     companyName: "Underground",
                                     isFavorite: false)
    }
}
