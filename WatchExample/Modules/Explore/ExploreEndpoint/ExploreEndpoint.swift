//
//  ExploreEndpoint.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

enum ExploreEndpoint {
    case nowPlayingMovies(page: Int)
    case popularMovies(page: Int)
    case upcomingMovies(page: Int)
    case topRatedMovies(page: Int)
}

extension ExploreEndpoint: Endpoint {
    var path: String {
        switch self {
        case .nowPlayingMovies:
            return "/3/movie/now_playing"
        case .popularMovies:
            return "/3/movie/popular"
        case .upcomingMovies:
            return "/3/movie/upcoming"
        case .topRatedMovies:
            return "/3/movie/top_rated"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .nowPlayingMovies, .popularMovies, .upcomingMovies, .topRatedMovies:
            return .get
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .nowPlayingMovies, .popularMovies, .upcomingMovies, .topRatedMovies:
            return nil
        }
    }
    var queryItems: [URLQueryItem]? {
        switch self {
        case .nowPlayingMovies(page: let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        case .popularMovies(page: let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        case .upcomingMovies(page: let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
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
