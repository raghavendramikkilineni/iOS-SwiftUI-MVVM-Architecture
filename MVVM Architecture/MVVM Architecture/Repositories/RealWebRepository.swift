//
//  RealWebRepository.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Combine
import Alamofire

struct RealWebRepository: WebRepository {
    let session: Session
    
    init(session: URLSession) {
        self.session = Session(configuration: session.configuration)
    }
    
    func call<Value: Decodable>(endpoint: URLRequestElement) -> AnyPublisher<Value, Error> {
        do {
            let request = try prepareRequest(for: endpoint)
            return session.request(request).publishDecodable(type: Value.self,  decoder: decoder(), emptyResponseCodes: Set([200])).value()
                .mapError {
                    if let responseCode = $0.responseCode {
                        return NetworkError.errorStatusCode(code: responseCode)
                    }else {
                        return NetworkError.unknownError
                    }
                }
                .eraseToAnyPublisher()
            
        } catch let error {
            return Fail<Value,Error>(error: error)
                .eraseToAnyPublisher()
        }
    }
    
    private func prepareRequest(for endPoint: URLRequestElement) throws -> URLRequest {
        let baseURl = "http://jsonplaceholder.typicode.com"
        let urlrequest = try endPoint.createUrlRequest(baseUrl: URL(string: baseURl)!)
        return urlrequest
    }
    
    private func decoder() -> JSONDecoder {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
