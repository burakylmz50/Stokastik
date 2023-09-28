//
//  ExploreViewModel.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

@MainActor class ExploreViewModel: ObservableObject {
    
    @Published private(set) var results: [TopRatedMoviesResponseResults] =  [TopRatedMoviesResponseResults]()
    @Published private(set) var error: Error?
    @Published private(set) var isLoading = false
    
    let moviesExploreList: MoviesExploreList
    
    init(moviesExploreList: MoviesExploreList) {
        self.moviesExploreList = moviesExploreList
        self.fetchMovies()
    }
    
    var page = 1
    var isFetching = false
    @Published var isEnd = false
    
    private let moviesService = ExploreService()
    
    func fetchMovies() {
        
        if !isFetching {
            isFetching.toggle()
            Task(priority: .background) {
                switch moviesExploreList {
                    
                case .nowPlaying:
                    do {
                        let results =  try await moviesService.fetchMovies(moviesExploreList: .nowPlaying, page: page)
                        self.isEnd = results.page ?? 0 >= results.totalPages ?? 0
                        self.results = self.results + (results.results ?? [])
                        self.page += 1
                    } catch let error {
                        self.error = error
                    }
                case .popularMovies:
                    do {
                        let results =  try await moviesService.fetchMovies(moviesExploreList: .popularMovies, page: page)
                        self.isEnd = results.page ?? 0 >= results.totalPages ?? 0
                        self.results = self.results + (results.results ?? [])
                        self.page += 1
                    } catch let error {
                        self.error = error
                    }
                    
                }
            }
            isFetching.toggle()
        }
    }
    
    func removeAllData() {
        results.removeAll()
    }
    
    func shouldLoadData(result: TopRatedMoviesResponseResults?) {
        if results.count >= 4, result == results[results.count - 3] {
            fetchMovies()
        }
    }
}

