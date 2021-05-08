//
//  URLRequestElement.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation

protocol URLRequestElement: Codable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    var parametersEncoding: ParameterEncoding { get }
}

extension URLRequestElement {
    func createUrlRequest(baseUrl: URL) throws -> URLRequest {
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try parametersEncoding.encode(urlRequest, with: parameters)
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case head = "HEAD"
}
