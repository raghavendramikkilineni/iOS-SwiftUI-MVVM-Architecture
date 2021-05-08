//
//  WebRepository.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Combine

protocol WebRepository {
    func call<Value: Decodable>(endpoint: URLRequestElement) -> AnyPublisher<Value, Error>
}

enum NetworkError: Swift.Error {
    case errorStatusCode(code: Int)
    case invalidUrl
    case unknownHost
    case missingAuthorization
    case unknownError
    case notReachable
}
