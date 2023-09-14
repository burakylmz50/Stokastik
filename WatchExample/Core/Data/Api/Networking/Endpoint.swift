//
//  Endpoint.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var body: [String: String]? { get }
    var parameters: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var parameters: [String : String]? {
        return ["api_key":"27956682db0fdf188d487121adfeff34"]
    }
}
