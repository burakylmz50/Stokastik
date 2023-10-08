//
//  MovieListService.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 4.10.2023.
//

import Foundation

protocol MovieListServiceable {
    func fetchMovies(moviesExploreList: MoviesExploreList, page: Int) async throws -> TopRatedMoviesResponse
    func getNowPlayingMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getPopularMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getUpcomingMovies(page: Int) async throws -> TopRatedMoviesResponse
    func getTopRatedMovies(page: Int) async throws -> TopRatedMoviesResponse
}

struct MovieListService: HTTPClient, ExploreServiceable {
    
    func fetchMovies(moviesExploreList: MoviesExploreList, page: Int) async throws -> TopRatedMoviesResponse {
        
        switch moviesExploreList {
        case .nowPlaying:
            return try await sendRequest(endpoint: ExploreEndpoint.nowPlayingMovies(page: page), responseModel: TopRatedMoviesResponse.self)
        case .popularMovies:
            return try await sendRequest(endpoint: ExploreEndpoint.popularMovies(page: page), responseModel: TopRatedMoviesResponse.self)
        }
    }
    
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
