//
//  ExploreService.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

protocol ExploreServiceable {
    func getTopRated(page: Int) async throws -> TopRatedMoviesResponse
}

struct ExploreService: HTTPClient, ExploreServiceable {
    func getTopRated(page: Int) async throws -> TopRatedMoviesResponse {
        return try await sendRequest(endpoint: ExploreEndpoint.topRatedMovies(page: page), responseModel: TopRatedMoviesResponse.self)
    }
}
