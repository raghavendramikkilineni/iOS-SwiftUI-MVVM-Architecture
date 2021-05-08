//
//  ParameterEncoding.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Alamofire

protocol ParameterEncoding {
    func encode(_ urlRequest: URLRequest, with parameter: [String: Any]?) throws -> URLRequest
}

struct URLEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequest, with parameter: [String : Any]?) throws -> URLRequest {
        try Alamofire.URLEncoding().encode(urlRequest, with: parameter)
    }
}

struct JSONEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequest, with parameter: [String : Any]?) throws -> URLRequest {
        try Alamofire.JSONEncoding().encode(urlRequest, with: parameter)
    }
}
