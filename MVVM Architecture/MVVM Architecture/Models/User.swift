//
//  User.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation

struct User {
    var userId: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var address: Address
    var company: Company
    var isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name, username, email, phone, website
        case address, company, isFavorite
    }
    
    struct Address: Codable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo
        
        enum CodingKeys: String, CodingKey {
            case street, suite, city, zipcode
            case geo
        }
    }
    
    struct Geo: Codable {
        var lat: String
        var lng: String
        
        enum CodingKeys: String, CodingKey {
            case lat, lng
        }
    }
    
    struct Company: Codable {
        var name: String
        var catchPhrase: String
        var bs: String
        
        enum CodingKeys: String, CodingKey {
            case name, catchPhrase, bs
        }
    }
}

extension User: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(name, forKey: .name)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(website, forKey: .website)
        try container.encode(address, forKey: .address)
        try container.encode(company, forKey: .company)
        try container.encode(isFavorite, forKey: .isFavorite)
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decode(Int.self, forKey: .userId)
        name = try values.decode(String.self, forKey: .name)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
        phone = try values.decode(String.self, forKey: .phone)
        website = try values.decode(String.self, forKey: .website)
        address = try values.decode(Address.self, forKey: .address)
        company = try values.decode(Company.self, forKey: .company)
        isFavorite = try? values.decode(Bool.self, forKey: .isFavorite)
    }
}
