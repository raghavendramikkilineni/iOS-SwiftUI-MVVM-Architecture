//
//  UsersEndPoint.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation

enum UsersEndPoint: String, URLRequestElement {
    case users
    
    var method: HTTPMethod {
        switch self {
        case .users:  return .get
        }
    }
    
    var path: String {
        switch self {
        case .users: return "/users"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .users: return [:]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .users: return [:]
        }
    }
    
    var parametersEncoding: ParameterEncoding {
        switch self {
        case .users: return URLEncoding()
        }
    }
}
