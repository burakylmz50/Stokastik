//
//  HTTPClient.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation
import Alamofire

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
//
//        if let params = endpoint.parameters {
//            urlComponents.setQueryItems(with: params)
//        }
//
//        guard let url = urlComponents.url else {
//            return .failure(.invalidURL)
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = endpoint.method.rawValue
//
//        if let body = endpoint.body {
//            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//        }
        
//        do {
//            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
//            guard let response = response as? HTTPURLResponse else {
//                return .failure(.noResponse)
//            }
//
//            switch response.statusCode {
//            case 200...299:
//                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
//                    return .failure(.decode)
//                }
//                return .success(decodedResponse)
//            case 401:
//                return .failure(.unauthorized)
//            default:
//                return .failure(.unexpectedStatusCode)
//            }
//        } catch {
//            return .failure(.unknown)
//        }
    
        
        
        
        return try await withUnsafeThrowingContinuation { continuation in
            AF.request(urlComponents, method: HTTPMethod(rawValue: endpoint.method.rawValue), parameters: endpoint.parameters)
            
                .validate(statusCode: 200..<299)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case let .success(data):
                        continuation.resume(with: .success(data))
                    case let .failure(error):
                        continuation.resume(with: .failure(error))
                    }
                }
        }
    }
}
