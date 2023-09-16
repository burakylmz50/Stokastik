//
//  ExploreService.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

protocol ExploreServiceable {
    func getNowPlayingMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getPopularMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getUpcomingMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getTopRatedMovies(page: Int) async throws -> TopRatedMoviesResponse
}

struct ExploreService: HTTPClient, ExploreServiceable {
    func getNowPlayingMovies(page: Int) async throws -> TopRatedMoviesResponse {
        return try await sendRequest(endpoint: ExploreEndpoint.nowPlayingMovies(page: page), responseModel: TopRatedMoviesResponse.self)
    }
    
    func getPopularMovies(page: Int) async throws -> TopRatedMoviesResponse {
        return try await sendRequest(endpoint: ExploreEndpoint.popularMovies(page: page), responseModel: TopRatedMoviesResponse.self)
    }
    
    func getUpcomingMovies(page: Int) async throws -> TopRatedMoviesResponse {
        return try await sendRequest(endpoint: ExploreEndpoint.upcomingMovies(page: page), responseModel: TopRatedMoviesResponse.self)
    }
    
    func getTopRatedMovies(page: Int) async throws -> TopRatedMoviesResponse {
        return try await sendRequest(endpoint: ExploreEndpoint.topRatedMovies(page: page), responseModel: TopRatedMoviesResponse.self)
    }
}
