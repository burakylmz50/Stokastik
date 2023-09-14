//
//  ExploreEndpoint.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

enum ExploreEndpoint {
    case topRatedMovies(page: Int)
}

extension ExploreEndpoint: Endpoint {
    var path: String {
        switch self {
        case .topRatedMovies:
            return "/3/movie/now_playing"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .topRatedMovies:
            return .get
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .topRatedMovies:
            return nil
        }
    }
    var queryItems: [URLQueryItem]? {
        switch self {
        case .topRatedMovies(page: let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String:String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
